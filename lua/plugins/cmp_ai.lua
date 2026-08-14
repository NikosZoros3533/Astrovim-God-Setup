return {
  "saghen/blink.cmp",
  optional = true,

  opts = function(_, opts)
    -- Initialize nested tables safely
    opts.sources = opts.sources or {}
    opts.sources.providers = opts.sources.providers or {}

    -- 1. Better completion source hierarchy
    opts.sources.default = { "lsp", "snippets", "path", "buffer" }

    -- 2. Better provider tuning & Gibberish Filtering
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
      score_offset = 10, -- Kept at the bottom of the list
      min_keyword_length = 4, -- Stops blink from suggesting 1-3 letter random words
      max_items = 4, -- Limits total buffer suggestions to avoid crowding
    }

    -- 3. CLEANED: Predictable frontend workflow keymaps (AI completely removed)
    opts.keymap = {
      preset = "default",

      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        "fallback",
      },

      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },

      ["<CR>"] = {
        "accept",
        "fallback",
      },

      ["<C-Space>"] = {
        "show",
        "show_documentation",
        "hide_documentation",
      },

      ["<C-e>"] = {
        "hide",
        "fallback",
      },
    }

    -- 4. Better completion UX
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
