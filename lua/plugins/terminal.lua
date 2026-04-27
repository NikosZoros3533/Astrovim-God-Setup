return {
  "akinsho/toggleterm.nvim",
  opts = {
    shell = "pwsh",
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], {
      noremap = true,
      silent = true,
    })
  end,
}
