-- Import
local utils = require "whoa.core.utils"
local get_icons = utils.get_icons

return {
  "williamboman/mason.nvim",

  name = "Mason",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    -- Check if Mason is active
    local active, mason = pcall(require, "mason")
    if not active then return end

    -- Check if Mason LSPConfig is active
    local _, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not active then return end

    -- Check if Mason Tool Installer is active
    local _, mason_tool = pcall(require, "mason-tool-installer")
    if not active then return end

    -- Setup Mason
    mason.setup {
      -- Icons
      ui = {
        icons = {
          package_installed = get_icons("GitStaged", 1),
          package_pending = get_icons("GitModified", 1),
          package_uninstalled = get_icons("GitUntracked", 1),
        },
      },
    }

    -- Setup LSP servers
    mason_lspconfig.setup {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "cssls",
        "tailwindcss",
        "emmet_ls",
        "phpactor",
        "pyright",
      },

      automatic_installation = true,
    }

    mason_tool.setup {
      ensure_installed = {
        "flake8",
        "prettier",
        "eslint_d",
        "stylua",
      },
    }
  end,

  keys = {
    { "<LEADER>pM", "<CMD>MasonUpdate<CR>", { noremap = true, desc = "Mason update" } },
    { "<LEADER>pp", "<CMD>Mason<CR>", { noremap = true, desc = "Mason home" } },
  },
}
