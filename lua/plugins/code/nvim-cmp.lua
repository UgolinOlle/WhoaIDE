return {
  "hrsh7th/nvim-cmp",

  name = "Completion",

  event = "InsertEnter",

  dependencies = {
    "neovim/nvim-lspconfig",                  -- LSP client
    "hrsh7th/cmp-nvim-lsp",                   -- source for LSP completions
    "hrsh7th/cmp-buffer",                     -- source for text in buffer
    "hrsh7th/cmp-path",                       -- source for file system paths
    "hrsh7th/cmp-cmdline",                    -- source for command line completions
    "hrsh7th/cmp-nvim-lua",                   -- source for nvim lua completions
    "hrsh7th/cmp-emoji",                      -- source for emoji completions
    "ray-x/cmp-treesitter",                   -- source for treesitter completions
    "chrisgrieser/cmp-nerdfont",              -- source for nerdfont completions
    "roobert/tailwindcss-colorizer-cmp.nvim", -- source for tailwindcss completions
    "onsails/lspkind.nvim",                   -- vs-code like pictograms

    "L3MON4D3/LuaSnip",                       -- Snippets
    "saadparwaiz1/cmp_luasnip",               -- Source for autocomplete
    "rafamadriz/friendly-snippets",           -- Snippets
  },

  config = function()
    -- Check if cmp is installed
    local active, cmp = pcall(require, "cmp")
    if not active then return end

    -- Check if luasnip is installed
    local active_luasnip, _ = pcall(require, "luasnip")
    if not active_luasnip then return end

    -- Check if lspkind is installed
    local active_lspkind, lspkind = pcall(require, "lspkind")
    if not active_lspkind then return end

    -- Setup luasnip
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Setup cmp for commandline
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, { { name = "cmdline" } }),
    })

    -- Setup cmp
    cmp.setup {
      -- Configure UI
      window = {
        completion = {
          border = "rounded",
        },
        documentation = {
          border = "rounded",
        },
      },

      -- Configure sources
      sources = cmp.config.sources {
        { name = "nvim_lsp" },    -- Source for LSP completions
        { name = "luasnip" },     -- Source for autocomplete
        { name = "buffer" },      -- Source for text in buffer
        { name = "path" },        -- Source for file paths
        { name = "cmdline" },     -- Source for command line completions
        { name = "nvim_lua" },    -- Source for nvim lua completions
        { name = "emoji" },       -- Source for emoji completions
        { name = "treesitter" },  -- Source for treesitter completions
        { name = "nerdfont" },    -- Source for nerdfont completions
        { name = "tailwindcss" }, -- Source for tailwindcss completions
      },

      -- Configure completion sources
      completion = {
        completeopt = "menu,menuone,noinsert",
      },

      -- Configure how nvim-cmp should handle snippets
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },

      -- Configure keybindings
      mapping = cmp.mapping.preset.insert {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
          select = true,
        },
      },

      -- Configure formatting
      formatting = {
        format = lspkind.cmp_format {
          mode = "symbol",
          with_text = true,
          ellipsis_char = "...",
          menu = {
            buffer = "[BUF]",
            nvim_lsp = "[LSP]",
            treesitter = "[TS]",
            luasnip = "[SNIP]",
            nvim_lua = "[LUA]",
            path = "[PATH]",
            cmdline = "[CMD]",
            emoji = "[EMOJI]",
          },
        },
      },
    }
  end,
}
