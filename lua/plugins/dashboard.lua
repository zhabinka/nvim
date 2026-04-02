-- Snacks dashboard customization

-- Read todo.md for dashboard
local todo_lines = {}
local todo_path = vim.fn.expand "~/notes/todo.md"
if vim.fn.filereadable(todo_path) == 1 then
  todo_lines = vim.fn.readfile(todo_path, "", 10)
end
local max_len = 0
for _, line in ipairs(todo_lines) do
  local len = vim.fn.strdisplaywidth(line)
  if len > max_len then max_len = len end
end
local padded = {}
local prefix = "                "
for _, line in ipairs(todo_lines) do
  local pad = string.rep(" ", max_len - vim.fn.strdisplaywidth(line))
  table.insert(padded, prefix .. line .. pad)
end
local todo_text = #padded > 0 and table.concat(padded, "\n") or "No todo.md found"

---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = "\u{f422} ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = "\u{f15b} ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "\u{f1dc} ", key = "w", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = "\u{f0c7} ", key = "s", desc = "Load Session", action = ":lua require('resession').load()" },
          { icon = "\u{f017} ", key = "o", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = "\u{f0e8} ", key = "L", desc = "Lazy", action = ":Lazy" },
          { icon = "\u{f011} ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { title = "Todo", icon = "\u{f00c} ", padding = 0 },
        { text = todo_text, padding = 1 },
        { section = "keys", padding = 1 },
        { section = "projects", title = "Projects", icon = " ", limit = 5, padding = 1 },
      },
    },
  },
}
