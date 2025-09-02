return {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    cmd = "ToggleTerm",
    config = function()
        require("toggleterm").setup({
            size = 15,
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

        -- Toggle the terminal in Normal mode with <leader>j
        vim.keymap.set("n", "<leader>j", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

        -- Use Ctrl + \ to toggle the terminal in Terminal mode
        vim.keymap.set("t", "<C-\\>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
    end,
}
