---@type LazySpec
return {
  "folke/todo-comments.nvim",
  event = "User AstroFile",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = true,
    keywords = {
      TODO = { icon = "\u{f00c} ", color = "#fb4934" },
      HACK = { icon = "\u{f490} " },
      WARN = { icon = "\u{f071} ", color = "#9d0006" },
      PERF = { icon = "\u{f423} ", color = "#8f3f71" },
      TEST = { icon = "\u{f400} ", color = "#d65d0e" },
      NOTE = { icon = "\u{f867} ", alt = { "INFO" } },
      TEMP = { icon = "\u{f00d} ", color = "#282828" },
      DOCS = { icon = "\u{f400} ", color = "#a89984" },
    },
  },
}
