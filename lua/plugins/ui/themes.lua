return {
  {
    "audibleblink/hackthebox.vim",

    name = "Hack The Box",

    priority = 1000,

    lazy = true,
  },
  {
    "tiesen243/vercel.nvim",
    name = "Vercel Theme",
    priority = 1000,
    lazy = false, -- Keep active theme loaded
    config = function()
      require("vercel").setup {
        theme = vim.o.background == "dark" and "dark" or "light",
        transparent = true,
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
          bufferline = false,
        },
        overrides = {},
      }

      vim.cmd.colorscheme "vercel"
    end,
  },
  {
    "projekt0n/github-nvim-theme",

    name = "GitHub Theme",

    lazy = true,

    priority = 1000,

    config = function()
      require("github-theme").setup {
        options = {
          transparent = true,
        },
      }
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",

    name = "Solarized Osaka",

    lazy = true,

    priority = 1000,

    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "Mofiqul/vscode.nvim",

    name = "VSCode",

    lazy = true,

    priority = 1000,

    opts = function()
      return {
        transparent = true,
      }
    end,
  },
}
