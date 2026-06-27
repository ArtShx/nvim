local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require "user.keymaps"
require "user.options"
require("lazy").setup("user.plugins")
require "user.comment"
require "user.nvim-tree"
require "user.telescope"
require "user.colorscheme"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.indentline"
require "user.whichkey"
require "user.alpha"
require "user.treesitter"
require "user.gitsigns"
require "user.cmp"
require "user.notify"
require "user.lsp"
require "user.autopairs"
-- require "user.project"
-- require "user.autocommands"
-- require "user.rust-tools"
--
-- require "user.neotest"
