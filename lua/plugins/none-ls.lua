-- Plugins disabled due to Neovim 0.12+ incompatibilities.
-- Re-enable after upstream fixes land and `:Lazy sync` is run.

---@type LazySpec
return {
  -- none-ls: crashes because vim.lsp._request_name_to_capability was removed.
  -- Re-enable when you have formatters/linters to register through it.
  { "nvimtools/none-ls.nvim", enabled = false },

  -- vim-illuminate: crashes due to nvim-treesitter locals API change.
  -- Re-enable after both plugins are updated.
  { "RRethy/vim-illuminate", enabled = false },
}
