-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Save undo history
vim.opt.undofile = true

-- Enable break indent
vim.opt.breakindent = true

-- Set copy and paste to global clipboard
vim.opt.clipboard:append('unnamedplus')

-- Setting up auto complete
-- vim.opt_local.autocomplete = true
vim.opt.completeopt = "fuzzy,popup,menuone,noselect"
