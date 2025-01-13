return {
  "folke/todo-comments.nvim",

  name = "Todo Comments",

  event = { "VeryLazy", "BufReadPre", "BufNewFile" },

  dependencies = {
    { "nvim-lua/plenary.nvim", name = "Plenary" },
  },

  keys = {
    { "]t", "<cmd>lua require('todo-comments').jump_next()<cr>", desc = "Next todo comment" },
    { "[t", "<cmd>lua require('todo-comments').jump_prev()<cr>", desc = "Previous todo comment" },
  },
}
