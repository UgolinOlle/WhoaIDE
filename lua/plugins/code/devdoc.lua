return {
  "luckasRanarison/nvim-devdocs",

  name = "Devdocs",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  cmd = {
    "DevdocsFetch",
    "DevdocsInstall",
    "DevdocsUninstall",
    "DevdocsOpen",
    "DevdocsOpenFloat",
    "DevdocsOpenCurrent",
    "DevdocsOpenCurrentFloat",
    "DevdocsUpdate",
    "DevdocsUpdateAll",
    "DevdocsBuild",
  },

  opts = {
    format = "markdown",
    ensure_installed = {
      "css",
      "html",
      "javascript",
      "lua",
      "react",
      "typescript",
      "c",
      "cpp",
      "git",
      "php",
      "twig",
    },
    wrap = true,
    previwer_cmd = "glow",
    cmd_args = { "-s", "auto", "-w", "97" },
    cmd_ignore = {},
    picker_cmd = true,
    picker_cmd_args = { "-s", "auto", "-w", "45" },
  },

  keys = {
    { "<LEADER>dd", "<CMD>DevdocsOpen<CR>", { noremap = true, silent = true } },
    { "<LEADER>ds", "<CMD>DevdocsOpenCurrentFloat<CR>", { noremap = true, silent = true } },
  },
}
