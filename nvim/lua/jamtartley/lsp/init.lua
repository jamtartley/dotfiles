local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "jamtartley.lsp.lsp-installer"
require("jamtartley.lsp.handlers").setup()
require "jamtartley.lsp.null-ls"
require "lsp_signature".setup({})
