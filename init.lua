local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- Polyfill TSNode:start() and TSNode:end_() removed in Neovim 0.12
-- Access the TSNode metatable directly from the Lua registry (registered as "treesitter_node" in Neovim C code)
do
  local tsnode_mt = debug.getregistry()["treesitter_node"]
  if tsnode_mt and tsnode_mt.__index and not tsnode_mt.__index.start then
    tsnode_mt.__index.start = function(self)
      local sr, sc = self:range()
      return sr, sc
    end
    tsnode_mt.__index.end_ = function(self)
      local _, _, er, ec = self:range()
      return er, ec
    end
  end
end

require "lazy_setup"
require "polish"
