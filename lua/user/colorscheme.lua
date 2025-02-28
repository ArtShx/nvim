-- local colorscheme = "tokyonight-moon"
-- local colorscheme = "vague"
local colorscheme = "kanagawa"
-- local colorscheme = "poimandres"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
