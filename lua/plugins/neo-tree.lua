---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["o"] = "open",
        ["O"] = { "order_by_type", nowait = true },
      },
    },
    filesystem = {
      filtered_items = {
        never_show = {
          ".DS_Store",
        },
      },
    },
  },
}
