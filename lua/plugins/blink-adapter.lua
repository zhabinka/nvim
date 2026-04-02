-- blink.compat: adapter for nvim-cmp sources to work with blink.cmp
-- Needed for vim-dadbod-completion and obs.nvim completion
---@type LazySpec
return {
  {
    "saghen/blink.compat",
    version = "2.*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "dadbod", "obs" },
        providers = {
          dadbod = {
            name = "Dadbod",
            module = "blink.compat.source",
            score_offset = 3,
          },
          obs = {
            name = "obs",
            module = "blink.compat.source",
            score_offset = 2,
          },
        },
      },
    },
  },
}
