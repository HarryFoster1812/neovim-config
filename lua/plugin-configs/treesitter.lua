return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- This ensures the plugin is loaded before we try to require 'nvim-treesitter.configs'
  lazy = false, 
  config = function()
    -- We use pcall (protected call) to catch errors gracefully if the module is missing
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup({
      -- A list of parser names, or "all"
      ensure_installed = { 
        "java", "rust", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and Treesitter at the same time.
        -- Set to false to let Treesitter take full control.
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end,
}
