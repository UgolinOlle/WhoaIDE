return {
  "folke/edgy.nvim",

  name = "Edgy",

  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,

  event = "VeryLazy",

  opts = {
    bottom = {
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        filter = function(buf, win) return vim.api.nvim_win_get_config(win).relative == "" end,
      },
      {
        ft = "lazyterm",
        title = "LazyTerm",
        size = { height = 0.4 },
        filter = function(buf) return not vim.b[buf].lazyterm_cmd end,
      },
      "Trouble",
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        filter = function(buf) return vim.bo[buf].buftype == "help" end,
      },
      { ft = "spectre_panel", size = { height = 0.4 } },
    },
    left = {
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf) return vim.b[buf].neo_tree_source == "filesystem" end,
        size = { height = 0.5 },
      },
      {
        title = function()
          local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
          return vim.fn.fnamemodify(buf_name, ":t")
        end,
        ft = "Outline",
        pinned = true,
        open = "SymbolsOutlineOpen",
      },
      "neo-tree",
    },
  },
}
