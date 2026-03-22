-- Cursor movement fix when line is too long
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap 'H' and 'L' to go to start and end of line
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'L', '$', { noremap = true, silent = true })

vim.api.nvim_set_keymap('o', 'H', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', 'L', '$', { noremap = true, silent = true })

-- Set 'qq' to exit modes
vim.api.nvim_set_keymap('i', 'qq', '<Esc>', { noremap = true})
vim.api.nvim_set_keymap('v', 'qq', '<Esc>', { noremap = true})
vim.api.nvim_set_keymap('t', 'qq', '<Esc>', { noremap = true})

-- Close parenthesese and quotes automatically when opening them
vim.api.nvim_set_keymap('i', '(', '()<Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', '<', '<><Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', '\'', '\'\'<Esc>i', { noremap = true })
vim.api.nvim_set_keymap('i', '\"', '\"\"<Esc>i', { noremap = true })

-- Set 'grd' to goto definition
vim.keymap.set('n', 'grd', function() vim.lsp.buf.definition() end, {
	desc = "[g]oto [r]eference [d]efinition",
	silent = true,
})

-- Set <leader>d to open diagnostic
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end, {
	desc = "open diagnostic in open window", silent = true
})

-- Set <leader>q to open quicklist
vim.keymap.set('n', '<leader>q', function() vim.diagnostic.setqflist() end, {
	desc = "open diagnostic in open window", silent = true
})
