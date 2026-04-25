if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- ~/.config/nvim/lua/plugins/auto_fix.lua
return {
  "neovim/nvim-lspconfig",
  opts = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        -- fix imports + eslint
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.addMissingImports", "source.fixAll" },
          },
        })

        -- format after
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
}
