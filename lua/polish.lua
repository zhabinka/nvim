-- This will run last in the setup process.
-- Place any custom lua that doesn't fit in the normal config locations here.

-- Auto-save session per directory on exit
local resession = require "resession"
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local cwd = vim.fn.getcwd()
    local name = cwd:gsub("^" .. vim.env.HOME, "")
    resession.save(name, { notify = false })
  end,
})
