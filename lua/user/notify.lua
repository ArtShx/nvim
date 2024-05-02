local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
  render = "compact",
  stages = "slide",
    timeout = 3000
})

local status_ok, telescope = pcall(require, "telescope")
if status_ok then
  -- enabling `Telescope notify`
  telescope.load_extension("notify")
end

vim.notify = notify
