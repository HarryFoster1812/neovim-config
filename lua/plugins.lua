local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- This handles everything in lua/plugin-configs/ automatically
    { import = "plugin-configs" },
  },
  -- You can disable change detection if you want it even less "dynamic"
  change_detection = { notify = false },
})
