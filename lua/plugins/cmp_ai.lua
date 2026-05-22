return {
  "saghen/blink.cmp",
  optional = true,

  opts = function(_, opts)
    opts.keymap = opts.keymap or {}

    -- Better completion source hierarchy
    opts.sources = opts.sources or {}
    opts.sources.default = {
      "lsp",
      "snippets",
      "path",
      "buffer",
    }

    -- Better provider tuning
    opts.sources.providers = opts.sources.providers or {}

    opts.sources.providers.lsp = {
      score_offset = 100,
    }

    opts.sources.providers.snippets = {
      score_offset = 90,
    }

    opts.sources.providers.path = {
      score_offset = 60,
    }

    opts.sources.providers.buffer = {
      score_offset = 40,
    }

    -- Predictable frontend workflow keymaps
    opts.keymap = {
      preset = "default",

      ["<Tab>"] = {
        -- 1. AI completion FIRST
        function()
          if vim.g.ai_accept then return vim.g.ai_accept() end
        end,

        -- 2. Completion navigation
        "select_next",

        -- 3. Snippet jump
        "snippet_forward",

        -- 4. Normal fallback
        "fallback",
      },

      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },

      -- Confirm completion
      ["<CR>"] = {
        "accept",
        "fallback",
      },

      -- Manual completion trigger
      ["<C-Space>"] = {
        "show",
        "show_documentation",
        "hide_documentation",
      },

      -- Close menu
      ["<C-e>"] = {
        "hide",
        "fallback",
      },
    }

    -- Better completion UX
    opts.completion = opts.completion or {}

    opts.completion.documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    }

    opts.completion.ghost_text = {
      enabled = true,
    }

    return opts
  end,
}
