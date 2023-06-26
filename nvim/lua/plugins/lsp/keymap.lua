local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- DAP
    vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "DAP Continue" })
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "DAP Step Over" })
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "DAP Step Into" })
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "DAP Step Out" })
    vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
    vim.keymap.set('n', '<Leader>dlb',
        function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
        { desc = "DAP Toggle Breakpoint (Log)" })
    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "DAP Open REPL" })
    vim.keymap.set('n', '<Leader>dlr', function() require('dap').run_last() end, { desc = "DAP Run Last" })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
    end, { desc = "DAP Widgets Hover" })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
    end, { desc = "DAP Widgets Preview" })
    vim.keymap.set('n', '<Leader>df', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
    end, { desc = "DAP Widgets Centered Float (Frames)" })
    vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
    end, { desc = "DAP Widgets Centered Float (Scopes)" })
end

M.on_attach = on_attach

return M
