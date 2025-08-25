-- ~/.config/nvim/lua/sthita/plugins/terminal.lua

return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  version = "*",
  cmd = "ToggleTerm",
  config = function()
    require("toggleterm").setup({
      size = 15, -- Adjust the height of the terminal pane
      open_mapping = [[<C-j>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      -- Change this line to make the terminal appear at the bottom
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      terminals = {},
    })

    vim.keymap.set("n", "<leader>j", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
    vim.keymap.set("t", "<leader>j", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
  end,
}
