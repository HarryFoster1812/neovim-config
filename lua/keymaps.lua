local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Use Tab and Shift-Tab to cycle through open files
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Move the actual tab order (Shift + Alt + l/h)
vim.keymap.set("n", "<A-L>", ":BufferLineMoveNext<CR>", opts)
vim.keymap.set("n", "<A-H>", ":BufferLineMovePrev<CR>", opts)

-- Close the current file (buffer)
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close current file" })


local builtin = require('telescope.builtin')

-- Search for files by name
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
-- Search for text inside files (requires 'ripgrep')
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
-- Search through your open tabs/buffers
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffers' })
-- Search through your help notes
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })
-- Resume last search
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume last search' })

-- Show the error message in a floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- Move between errors
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
