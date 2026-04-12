-- This will run last in the setup process.
-- Place any custom lua that doesn't fit in the normal config locations here.

-- Async format on save (non-blocking)
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function(args)
    local clients = vim.lsp.get_clients { bufnr = args.buf }
    for _, client in ipairs(clients) do
      if client.supports_method "textDocument/formatting" then
        vim.lsp.buf.format { async = true, bufnr = args.buf }
        return
      end
    end
  end,
})

-- Auto-save session per directory on exit
local resession = require "resession"
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local cwd = vim.fn.getcwd()
    local name = cwd:gsub("^" .. vim.env.HOME, "")
    resession.save(name, { notify = false })
  end,
})
