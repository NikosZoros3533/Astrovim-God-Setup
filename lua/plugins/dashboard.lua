-- customize dashboard options
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = table.concat({
          "",
          [[ _____  ___    _______    ______  ___      ___  __     ___      ___ ]],
          [[(\"   \|"  \  /"     "|  /    " \|"  \    /"  ||" \   |"  \    /"  |]],
          [[|.\\   \    |(: ______) // ____  \\   \  //  / ||  |   \   \  //   |]],
          [[|: \.   \\  | \/    |  /  /    ) :)\\  \/. ./  |:  |   /\  \/.    |]],
          [[|.  \    \. | // ___)_(: (____/ //  \.    //   |.  |  |: \.        |]],
          [[|    \    \ |(:      "|\        /    \\   /    /\  |\ |.  \    /:  |]],
          [[ \___|\____\) \_______) \"_____/      \__/    (__\_|_)|___|\__/|___|]],
          "",
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
