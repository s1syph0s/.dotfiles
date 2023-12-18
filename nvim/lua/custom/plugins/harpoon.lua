return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup({})
		-- REQUIRED

		vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = '[H]arpoon [A]ppend' })
		vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon [T]oggle menu' })

		vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = 'Goto Harpoon 1st' })
		vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = 'Goto Harpoon 2nd' })
		vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = 'Goto Harpoon 3rd' })
		vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = 'Goto Harpoon 4th' })
	end
}
