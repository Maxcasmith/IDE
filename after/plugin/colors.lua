DEFAULT = "tokyonight"
STORM = "tokyonight-storm"
DAY = "tokyonight-day"
NIGHT = "tokyonight-night"
MOON = "tokyonight-moon"

function Color(property, color)
  vim.api.nvim_set_hl(0, property, { bg = color })
end

function Colorscheme(color)
  color = color or MOON
  vim.cmd.colorscheme(color)

  --Color("Normal", "none")
 -- Color("NormalFloat", "none")
end

Colorscheme()
