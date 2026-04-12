---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "lexical",
        "stylua",
        "tree-sitter-cli",
      },
    },
  },
}
