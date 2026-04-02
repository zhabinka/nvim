---@type LazySpec
return {
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  config = function()
    require("gruvbox").setup {
      contrast = "soft",
      overrides = {
        FoldColumn = { bg = "#f2e5bc" },
        SignColumn = { bg = "#f2e5bc" },
        GitSignsAdd = { fg = "#98971a", bg = "#f2e5bc", reverse = false },
        GitSignsChange = { fg = "#689d6a", bg = "#f2e5bc", reverse = false },
        GitSignsDelete = { fg = "#cc241d", bg = "#f2e5bc", reverse = false },
        ["@module"] = { fg = "#b57614", bold = true },
      },
    }
  end,
}
