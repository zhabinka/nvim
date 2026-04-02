---@type LazySpec
return {
  "kristijanhusak/vim-dadbod-ui",
  event = "VeryLazy",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  keys = {
    { "<Leader>D", "<cmd>DBUI<CR>", desc = "Open DBUI" },
    { "<Leader>Dt", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    { "<Leader>DA", "<cmd>DBUIAddConnection<CR>", desc = "Add DB connection" },
    { "<Leader>DF", "<cmd>DBUIFindBuffer<CR>", desc = "Find buffer DBUI" },
  },
  init = function()
    vim.g.db_ui_win_position = "right"
    vim.g.db_ui_winwidth = 50
    vim.g.db_ui_winheight = 15
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_use_nvim_notify = 1
    vim.g.db_ui_save_location = "~/sql/"
    vim.g.db_ui_tmp_query_location = "~/sql/tmp/"
    vim.g.db_ui_connection_patterns = {
      ["postgres"] = {
        pattern = "^postgres://(\\w+):(\\w+)@",
        driver = "postgres",
      },
    }
  end,
}
