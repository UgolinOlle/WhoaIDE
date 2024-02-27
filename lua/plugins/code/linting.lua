return {
  "mfussenegger/nvim-lint",

  event = {
    "BufReadPre",
    "BufNewFile",
  },

  config = function()
    local active, lint = pcall(require, "lint")
    if not active then return end

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascriptreact = { "eslint_d" },
    },

    local lint_augroup = vim.api.nvim_create_augroups("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" },
    {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end
}
