require('packer_init')

require('core.options')
require('core.keymaps')
require('core.colors')

require('plugins.mason_settings')
require('plugins.lsp_config')
require('plugins.cmp')
require('plugins.nvim_tree')
require('plugins.feline')
require('plugins.lsp.dap.dapui')
require('plugins.lsp.dap.configs')
require('plugins.telescope')

print("Init success")
