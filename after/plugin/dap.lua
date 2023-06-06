local dap = require("dap")
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
local server = require("dap-vscode-js")

local DEBUGGER_PATH = os.getenv('HOME') .. "/dapServers/vscode-js-debug"
local LOGFILE_PATH = os.getenv('HOME') .. "/dapServers/vscode-js-debug/logs.txt"

server.setup({
  debugger_path = DEBUGGER_PATH,
  log_file_path = LOGFILE_PATH,
  log_file_level = 1,
  adapters = {
    'pwa-node',
    'pwa-chrome',
    'pwa-msedge',
    'node-terminal',
    'pwa-extensionHost'
  }
})

dap.adapters.php = {
    type = 'executable',
    command = 'nodejs',
    args = {os.getenv('HOME') .. "/dapServers/vscode-js-debug/out/phpDebug.js"},
}

for _, language in ipairs {"typescript", "javascript"} do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Mocha Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/mocha/bin/mocha.js",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      type = "pwa-chrome",
      name = "Attach - Remote Debugging",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      name = "Launch Chrome",
      request = "launch",
      url = "http://localhost:3000",
    },
  }
end

for _, language in ipairs { "typescriptreact", "javascriptreact" } do
  dap.configurations[language] = {
    {
      type = "pwa-chrome",
      name = "Attach - Remote Debugging",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      name = "Launch Chrome",
      request = "launch",
      url = "http://localhost:3000",
    },
  }
end

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = '9003',
        log = true,
        serverSourceRoot = '/srv/www/',
        localSourceRoot = '/home/www/VVV/www/',
    },
}

vim.fn.sign_define('DapBreakpoint', { text='⬤', texthl='', linehl='', numhl='' })
vim.keymap.set('n', "dap", function() require("dapui").toggle() end)
vim.keymap.set('n', "bp", function () dap.toggle_breakpoint() end)
