-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to space
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Terminal mappings
map('t', '<Esc>', '<C-\\><C-n>') -- exit

-- LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>') -- open/close
map('n', '<leader>n', ':NvimTreeFindFile<CR>') -- search file

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = "[T]elescope [F]ind files" })
vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = "[T]elescope [G]rep" })
vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = "[T]elescope [B]uffers" })
vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = "[T]elescope [H]elp tags" })
vim.keymap.set('n', '<leader>tc', builtin.commands, { desc = "[T]elescope [C]ommands" })
vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = "[T]elescope [D]iagnostics" })
