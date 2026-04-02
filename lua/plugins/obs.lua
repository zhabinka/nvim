---@type LazySpec
return {
  "IlyasYOY/obs.nvim",
  event = "VeryLazy",
  dependencies = {
    "IlyasYOY/coredor.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local obs = require "obs"

    obs.setup {
      vault_home = "~/notes",
      vault_name = "notes",
      journal = {
        template_name = "note",
        daily_template_name = "daily",
        weekly_template_name = "weekly",
      },
    }

    vim.keymap.set("n", "<Leader>nn", "<cmd>ObsNvimFollowLink<cr>")
    vim.keymap.set("n", "<Leader>nr", "<cmd>ObsNvimRandomNote<cr>")
    vim.keymap.set("n", "<Leader>nN", "<cmd>ObsNvimNewNote<cr>")
    vim.keymap.set("n", "<Leader>ny", "<cmd>ObsNvimCopyObsidianLinkToNote<cr>")
    vim.keymap.set("n", "<Leader>no", "<cmd>ObsNvimOpenInObsidian<cr>")
    vim.keymap.set("n", "<Leader>nd", "<cmd>ObsNvimDailyNote<cr>")
    vim.keymap.set("n", "<Leader>nw", "<cmd>ObsNvimWeeklyNote<cr>")
    vim.keymap.set("n", "<Leader>nrn", "<cmd>ObsNvimRename<cr>")
    vim.keymap.set("n", "<Leader>nT", "<cmd>ObsNvimTemplate<cr>")
    vim.keymap.set("n", "<Leader>nM", "<cmd>ObsNvimMove<cr>")
    vim.keymap.set("n", "<Leader>nb", "<cmd>ObsNvimBacklinks<cr>")
    -- Search notes via Telescope (find commands removed in newer obs.nvim)
    vim.keymap.set("n", "<Leader>nff", function()
      require("telescope.builtin").find_files { cwd = "~/notes" }
    end, { desc = "Find note" })
    vim.keymap.set("n", "<Leader>nfw", function()
      require("telescope.builtin").live_grep { cwd = "~/notes" }
    end, { desc = "Find in notes" })
    vim.keymap.set("n", "<Leader>nfj", function()
      require("telescope.builtin").live_grep { cwd = "~/notes/journal" }
    end, { desc = "Find in journal" })
  end,
}
