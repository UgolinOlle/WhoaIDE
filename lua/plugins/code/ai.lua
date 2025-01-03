return {
  "yetone/avante.nvim",

  event = "VeryLazy",

  lazy = false,

  version = false,

  opts = {
    provider = "copilot",
    vendors = {
      ["ollama"] = {
        ["local"] = true,
        endpoint = "127.0.0.1:11434/v1",
        model = "codegemma",
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/chat/completions",
            headers = {
              ["Accept"] = "application/json",
              ["Content-Type"] = "application/json",
            },
            body = {
              model = opts.model,
              messages = require("avante.providers").copilot.parse_messages(code_opts),
              max_tokens = 2048,
              stream = true,
            },
          }
        end,
        parse_response = function(data_stream, event_state, opts)
          require("avante.providers").copilot.parse_response(data_stream, event_state, opts)
        end,
      },
    },
  },

  build = "make",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "MeanderingProgrammer/render-markdown.nvim",

      opts = {
        file_types = { "markdown", "Avante" },
      },

      ft = { "markdown", "Avante" },
    },
  },
}
