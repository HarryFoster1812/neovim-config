return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- This is the key: show all open files
        style_preset = require("bufferline").style_preset.default,
        separator_style = "slant", -- Looks very modern
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        -- This makes the bufferline push over when Neo-tree is open
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          }
        },
        diagnostics = "nvim_lsp", -- Show LSP errors/warnings on the tabs
      }
    })
  end
}
