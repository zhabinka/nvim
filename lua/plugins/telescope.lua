-- Telescope keybindings (used by obs.nvim and other plugins)
---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
          ["<C-p>"] = "cycle_history_prev",
          ["<C-n>"] = "cycle_history_next",
        },
      },
    },
  },
}
