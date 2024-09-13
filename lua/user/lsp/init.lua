-- require "user.lsp.coc"
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

-- require "user.lsp.rust-tools"
-- require "user.lsp.flake8"
