---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = false,
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {
      "lua_ls",
      "elixirls",
    },
    config = {},
    handlers = {},
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    mappings = {
      n = {
        gd = {
          function() vim.lsp.buf.definition() end,
          desc = "Go to definition",
          cond = "textDocument/definition",
        },
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        gr = {
          function() vim.lsp.buf.references() end,
          desc = "References of current symbol",
          cond = "textDocument/references",
        },
        gi = {
          function() vim.lsp.buf.implementation() end,
          desc = "Implementation of current symbol",
          cond = "textDocument/implementation",
        },
        K = {
          function() vim.lsp.buf.hover() end,
          desc = "Hover documentation",
          cond = "textDocument/hover",
        },
        ["<Leader>la"] = {
          function() vim.lsp.buf.code_action() end,
          desc = "LSP code action",
          cond = "textDocument/codeAction",
        },
        ["<Leader>lr"] = {
          function() vim.lsp.buf.rename() end,
          desc = "Rename symbol",
          cond = "textDocument/rename",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
  },
}
