local colorscheme = "tokyonight-moon"
-- local colorscheme = "vague"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
