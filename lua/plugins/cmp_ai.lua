return {
  "saghen/blink.cmp",
  optional = true,
  opts = function(_, opts)
    -- 🔧 reduce completion noise
    opts.sources = opts.sources or {}
    opts.sources.default = {"lsp","path"}
    opts.sources.providers = opts.sources.providers or {}
    -- 🧠 add AI suggestions as a source
    opts.keymap = opts.keymap or {}
    opts.keymap["<Tab>"] = {
      function(cmp)
        -- 1. AI suggestion FIRST
        if vim.g.ai_accept then
          return vim.g.ai_accept()
        end
        -- 2. LSP completion SECOND
        if cmp.is_visible() then
          return cmp.select_and_accept()
        end
        -- 3. snippet THIRD
        if cmp.snippet_active() then
          return cmp.snippet_forward()
        end
      end,
      "fallback",
    }

    opts.keymap["<S-Tab>"] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.snippet_backward()
        end
      end,
      "fallback",
    }

    return opts
  end,
}
