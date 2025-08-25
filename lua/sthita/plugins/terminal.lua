return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	cmd = "ToggleTerm",
	config = function()
		require("toggleterm").setup({
			size = 15, -- Adjust the height of the terminal pane
			-- open_mapping = [[<C-j>]], -- REMOVE OR COMMENT OUT THIS LINE
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			terminals = {},
		})

		-- Your keymaps for toggling the terminal with <leader>j will now work
		vim.keymap.set("n", "<leader>j", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
		vim.keymap.set("t", "<leader>j", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
	end,
}
