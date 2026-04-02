-- Fix missing file icons (using hex escapes to survive git)
---@type LazySpec
return {
  "mini.icons",
  config = function(plugin, opts)
    opts.extension = opts.extension or {}
    opts.filetype = opts.filetype or {}
    opts.extension["exs"] = { glyph = "\xee\x98\xad", hl = "MiniIconsPurple" }
    opts.extension["md"] = { glyph = "\xee\x9c\xbe", hl = "MiniIconsBlue" }
    opts.extension["sh"] = { glyph = "\xef\x92\x89", hl = "MiniIconsGrey" }
    opts.extension["yaml"] = { glyph = "\xef\x85\xa0", hl = "MiniIconsGrey" }
    opts.extension["yml"] = { glyph = "\xef\x85\xa0", hl = "MiniIconsGrey" }
    opts.extension["csv"] = { glyph = "\xef\x80\x8a", hl = "MiniIconsGreen" }
    opts.extension["lua"] = { glyph = "\xee\x98\xa0", hl = "MiniIconsBlue" }
    opts.extension["example"] = { glyph = "\xef\x85\x9b", hl = "MiniIconsGrey" }
    opts.extension["toml"] = { glyph = "\xef\x80\xa2", hl = "MiniIconsGrey" }
    opts.file = opts.file or {}
    opts.filetype["markdown"] = { glyph = "\xee\x9c\xbe", hl = "MiniIconsBlue" }
    opts.filetype["yaml"] = { glyph = "\xef\x85\xa0", hl = "MiniIconsGrey" }
    opts.file["README.md"] = { glyph = "\xee\x9c\xbe", hl = "MiniIconsBlue" }
    opts.file["readme.md"] = { glyph = "\xee\x9c\xbe", hl = "MiniIconsBlue" }
    opts.file["init.lua"] = { glyph = "\xee\x98\xa0", hl = "MiniIconsBlue" }
    opts.file[".stylua.toml"] = { glyph = "\xef\x80\xa2", hl = "MiniIconsGrey" }
    opts.file["VERSION"] = { glyph = "\xef\x84\x81", hl = "MiniIconsGrey" }
    require("mini.icons").setup(opts)
    MiniIcons.mock_nvim_web_devicons()
  end,
}
