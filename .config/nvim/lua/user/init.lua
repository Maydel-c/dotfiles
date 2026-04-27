-- general Neovim settings
vim.o.scrolloff = 10

-- disable autoformat for C and C++
vim.g.autoformat_enabled_c = false
vim.g.autoformat_enabled_cpp = false

-- configure LSP servers
return {
  lsp = {
    servers = {
      "clangd",
    },
  },
}
