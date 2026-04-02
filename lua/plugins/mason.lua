---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "elixir-ls",
        "stylua",
        "tree-sitter-cli",
      },
    },
  },
}
