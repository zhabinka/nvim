---@type LazySpec
return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "honza/vim-snippets",
  },
  config = function(plugin, opts)
    local ls = require "luasnip"

    ls.config.set_config {
      updateevents = "TextChanged,TextChangedI",
    }

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.jumpable(-1) then ls.jump(-1) end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.expand_or_jumpable() then ls.expand_or_jump() end
    end, { silent = true })

    vim.keymap.set("i", "<C-l>", function()
      if ls.choice_active() then ls.change_choice(1) end
    end)

    vim.keymap.set("i", "<C-h>", function()
      if ls.choice_active() then ls.change_choice(-1) end
    end)

    -- Load default AstroNvim LuaSnip config if available
    local ok, astronvim_config = pcall(require, "astronvim.plugins.configs.luasnip")
    if ok then astronvim_config(plugin, opts) end

    require("luasnip.loaders.from_snipmate").lazy_load()

    require("luasnip.loaders.from_lua").lazy_load {
      paths = vim.fn.stdpath "config" .. "/lua/snippets",
    }
  end,
}
