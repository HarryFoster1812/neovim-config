return {
  "nanozuki/tabby.nvim",
  event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
    local theme = {
      fill = 'TabLineFill',
      head = 'TabLine',
      current_tab = 'TabLineSel',
      tab = 'TabLine',
      win = 'TabLine',
      tail = 'TabLine',
    }

    require('tabby.tabline').set(function(line)
      return {
        {
          { '   ', hl = theme.head },
          line.sep('', theme.head, theme.fill),
        },

        line.tabs().foreach(function(tab)
          local hl = tab.is_current() and theme.current_tab or theme.tab

          return {
            line.sep('', hl, theme.fill),
            tab.is_current() and '' or '󰆣',
            tab.number(),
            tab.name(),
            tab.close_btn('󰅖'),
            line.sep('', hl, theme.fill),
            hl = hl,
            margin = ' ',
          }
        end),

        line.spacer(),

        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
          return {
            line.sep('', theme.win, theme.fill),
            win.is_current() and '' or '',
            win.buf_name(),
            line.sep('', theme.win, theme.fill),
            hl = theme.win,
            margin = ' ',
          }
        end),

        {
          line.sep('', theme.tail, theme.fill),
          { '  ', hl = theme.tail },
        },
      }
    end)

    -- Remove the initial empty [No Name] buffer once a real file is opened.
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local current = vim.api.nvim_get_current_buf()

    -- Only do anything when we've entered an actual file.
    if vim.bo[current].buftype ~= "" then
      return
    end

    if vim.api.nvim_buf_get_name(current) == "" then
      return
    end

    -- Find an empty [No Name] buffer.
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if buf ~= current
        and vim.api.nvim_buf_is_valid(buf)
        and vim.bo[buf].buflisted
        and vim.bo[buf].buftype == ""
        and vim.api.nvim_buf_get_name(buf) == ""
        and not vim.bo[buf].modified
      then
        vim.api.nvim_buf_delete(buf, { force = false })
      end
    end
  end,
})

  end,
}
