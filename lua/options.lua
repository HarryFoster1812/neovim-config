vim.opt.clipboard = 'unnamedplus'   -- use system clipboard 
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used in nvim

vim.g.mapleader = " "

-- Tab
vim.opt.tabstop = 2                 -- number of visual spaces per TAB
vim.opt.softtabstop = 2             -- number of spaces in tab when editing
vim.opt.shiftwidth = 2              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of Python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false            -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- Create a function to handle "Smart Quit"
_G.smart_quit = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local buf_ft = vim.bo[bufnr].filetype

  -- If we are in Neo-tree, just close the window or do nothing
  if buf_ft == "neo-tree" then
    vim.cmd("Neotree close")
    return
  end

  -- If there's only one buffer left, just quit Neovim
  local listed_buffers = vim.fn.getbufinfo({buflisted = 1})
  if #listed_buffers <= 1 then
    vim.cmd("quit")
    return
  end

  -- Otherwise, use the bufdelete plugin (if you installed it) 
  -- or a standard move-and-delete
  vim.cmd("bnext")
  vim.cmd("confirm bdelete #")
end

-- Map it to a command or abbreviation
vim.cmd("cnoreabbrev q lua smart_quit()")
