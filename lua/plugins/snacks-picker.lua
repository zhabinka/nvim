-- Snacks picker, indent, notifier customization
---@type LazySpec
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<C-p>"] = { "history_back", mode = { "i", "n" } },
            ["<C-n>"] = { "history_forward", mode = { "i", "n" } },
            ["<C-g>"] = { "edit_split", mode = { "i", "n" } },
          },
        },
      },
    },
    notifier = {
      top_down = false,
    },
  },
}
