-- customize dashboard options
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = table.concat({
          "",
          "███╗   ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██╔═══██╗██║   ██║██║████╗ ████║",
          "██╔██╗ ██║██║   ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
          "        React / Neovim Workspace",
        }, "\n"),
        -- keys = {
        --   key = "d",
        --   desc = "Run Dev Server",
        --   action = function() vim.cmd "botright 15split | terminal npm run dev" end,
        -- },
      },
    },
  },
}
