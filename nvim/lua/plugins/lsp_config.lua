-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = require('plugins.lsp.keymap').on_attach

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Sumneko Lua
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- PyRight
lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Clangd
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Rust
local rt = require("rust-tools")

rt.setup({
    tools = {

    },
    server = {
        on_attach = on_attach,
        settings = {
            ["rust-analyzer"] = {
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true
                },
                checkOnSave = {
                    command = "clippy",
                },
            }
        }
    },
})
--lspconfig['rust_analyzer'].setup({
--    on_attach = on_attach,
--    settings = {
--        ["rust-analyzer"] = {
--            imports = {
--                granularity = {
--                    group = "module",
--                },
--                prefix = "self",
--            },
--            cargo = {
--                buildScripts = {
--                    enable = true,
--                },
--            },
--            procMacro = {
--                enable = true
--            },
--            checkOnSave = {
--                command = "clippy",
--            },
--        }
--    }
--})
