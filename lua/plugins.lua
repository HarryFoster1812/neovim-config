-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.loop or vim.uv).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Automatically require all Lua files inside plugin-configs/
local plugin_specs = {}
local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugin-configs"
for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
  if file:sub(-4) == ".lua" then
    local modname = file:sub(1, -5)  -- strip .lua
    table.insert(plugin_specs, require("plugin-configs." .. modname))
  end
end

-- Setup lazy.nvim with all plugin specs
require("lazy").setup(plugin_specs)
