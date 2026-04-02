---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = false,
        number = true,
        spell = false,
        signcolumn = "yes",
        foldcolumn = "1",
        foldlevel = 99,
        foldlevelstart = 99,
        foldenable = true,
        wrap = true,
        laststatus = 0,
        spelllang = "ru_ru,en_us",
        langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
      },
      g = {},
    },
    -- Treesitter configuration (moved from nvim-treesitter plugin in v3)
    treesitter = {
      highlight = true,
      indent = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "elixir",
        "eex",
        "heex",
        "erlang",
        "bash",
        "dockerfile",
        "git_config",
        "gitignore",
        "gitattributes",
        "make",
        "markdown",
        "sql",
        "yaml",
        "json",
        "html",
        "python",
        "toml",
        "org",
      },
    },
    mappings = {
      i = {
        ["<C-х>"] = { "<C-[>", desc = "Exit from insert mode" },
        ["<C-г>"] = { "<C-G>u<C-U>", desc = "" },
        ["<C-ц>"] = { "<C-G>u<C-W>", desc = "" },
        ["<C-s>"] = { "<cmd>w<cr><esc>", desc = "Save File with insert mode" },
        ["<C-ы>"] = { "<cmd>w<cr><esc>", desc = "Save File" },
        ["<C-d>"] = { "<DEL>", desc = "Delete character right of the cursor" },
        ["<C-Enter>"] = { "<esc>o", desc = "Add blank line above pointer and go to it" },
        ["<S-Enter>"] = { "<esc>O", desc = "Add blank line below pointer and go to it" },
        ["<C-j>"] = { "<esc>gji", desc = "Move to next line" },
        ["<C-k>"] = { "<esc>gki", desc = "Move to prev line" },
        ["<C-l>"] = { "<esc>la", desc = "Move to next char" },
        ["<C-h>"] = { "<esc>i", desc = "Move to prev char" },
        ["<C-a>"] = { "<esc>A", desc = "Move to end of line" },
        ["<C-i>"] = { "<esc>I", desc = "Move to start of line" },
        ["<C-;>"] = { "<esc>;a", desc = "Repeat previous f, t, F or T movement" },
        ["<C-,>"] = { "<esc>,a", desc = "Repeat previous f, t, F or T movement, backwards" },
      },
      x = {
        ["c"] = { '"_c', desc = "" },
        ["<C-[>"] = { "^", desc = "Select from cursor to start of line" },
        ["<C-]>"] = { "g_", desc = "Select from cursor to end of line" },
      },
      n = {
        -- Russian layout support
        ["л"] = { "gk", desc = "" },
        ["о"] = { "gj", desc = "" },
        ["<Leader>ц"] = { "<cmd>w<cr>", desc = "Save File" },

        -- Change without yanking
        ["c"] = { '"_c', desc = "" },
        ["C"] = { '"_C', desc = "" },
        ["cc"] = { '"_cc', desc = "" },

        -- Go to start or end of line
        ["<C-[>"] = { "^", desc = "Go to start line" },
        ["<C-]>"] = { "g_", desc = "Go to end line" },
        ["<C-a>"] = { "<HOME>", desc = "Go to start line" },
        ["<C-e>"] = { "<END>", desc = "Go to end line" },

        -- Blank lines
        ["<Enter>"] = { "a<CR><esc>", desc = "Move line to new blank" },
        ["<C-Enter>"] = { ":call append(line('.'), '')<CR>", desc = "Add blank line above the cursor" },
        ["<S-Enter>"] = { ":call append(line('.')-1, '')<CR>", desc = "Add blank line below cursor" },

        -- Spaces and underscores
        ["<Space>i"] = { "i<Space><esc>", desc = "Add space before pointer" },
        ["<Space>a"] = { "a<Space><esc>", desc = "Add space after pointer" },
        ["_i"] = { "i_<esc>", desc = "Add underscore before pointer" },
        ["_a"] = { "a_<esc>", desc = "Add underscore after pointer" },

        -- Buffer navigation (v6 API)
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Buffer close from tabline
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },

        -- Todo-comments navigation
        ["]n"] = { function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
        ["[n"] = { function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
        ["<Leader>fn"] = { "<cmd>TodoTelescope<cr>", desc = "Show todo comments with Telescope" },

        -- Cellular automaton
        ["<Leader>ml"] = { "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make It Rain Cellular Automaton" },
        ["<Leader>mk"] = { "<cmd>CellularAutomaton game_of_life<CR>", desc = "Game Of Life Cellular Automaton" },

        -- Quick save
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" },

        -- Git
        ["<Leader>gh"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" },
        ["<Leader><C-B>"] = { "<cmd>Gitsigns blame<cr>", desc = "Git blame" },

        -- Sessions (resession)
        ["<Leader>fs"] = { function() require("resession").load() end, desc = "Search sessions" },

        -- Groups
        ["<Leader>b"] = { desc = "Buffers" },
      },
    },
  },
}
