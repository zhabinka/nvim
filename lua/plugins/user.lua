---@type LazySpec
return {
  { "fedepujol/move.nvim", event = "BufEnter" },
  { "eandrju/cellular-automaton.nvim", event = "VeryLazy" },
  { "tpope/vim-dotenv", event = "VeryLazy" },
  { "lewis6991/foldsigns.nvim", event = "BufEnter", config = function() require("foldsigns").setup() end },
  {
    "epilande/checkbox-cycle.nvim",
    ft = "markdown",
    opts = { states = { "[ ]", "[x]" } },
    keys = {
      { "<CR>", "<Cmd>CheckboxCycleNext<CR>", desc = "Checkbox Next", ft = { "markdown" }, mode = { "n", "v" } },
      { "<S-CR>", "<Cmd>CheckboxCyclePrev<CR>", desc = "Checkbox Previous", ft = { "markdown" }, mode = { "n", "v" } },
      { "<Leader>x", "<Cmd>CheckboxCycleNext<CR>", desc = "Checkbox Next", ft = { "markdown" }, mode = { "n", "v" } },
    },
  },
}
