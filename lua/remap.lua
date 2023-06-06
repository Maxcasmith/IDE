local map = function(type, shortcut, command)
  vim.keymap.set(type, shortcut, command)
end

-- Move highlighted lines up and down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z") -- Keep cursor static col when appending lines

-- System clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+y")

-- Tab Control
map("n", "tn", ":tabnew<CR>")
map("n", "tc", ":tabclose<CR>")

function OpenFileInNewTab(filename)
  for i = 1, vim.fn.tabpagenr('$') do
    local buflist = vim.fn.tabpagebuflist(i)
    for _, bufnr in ipairs(buflist) do
      if vim.fn.bufname(bufnr) == filename then
        vim.cmd('tabnext ' .. i)
        return
      end
    end
  end
  vim.cmd('tabnew ' .. filename)
end
