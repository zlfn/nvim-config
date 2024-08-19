require'nvim-treesitter.configs'.setup {
  ensure_installed = {"elixir", "heex", "eex", "rust",
  "javascript", "typescript", "tsx", "html"},
  -- ensure_installed = "all", -- install parsers for all supported languages
  sync_install = false,
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
  },
}
