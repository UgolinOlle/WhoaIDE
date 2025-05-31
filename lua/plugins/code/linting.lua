return {
    "mfussenegger/nvim-lint",
    name = "NeoVim Lint",
    event = {"BufEnter", "BufReadPre", "BufNewFile"},
    dependencies = {"williamboman/mason.nvim"},
    config = function()
        -- Check if nvim-lint is available
        local active, lint = pcall(require, "lint")
        if not active then
            return
        end

        -- Manual declaration of the taplo linter for TOML
        lint.linters.taplo = {
            cmd = "taplo",
            stdin = false,
            args = {"lint", "--no-config"},
            stream = "stdout",
            ignore_exitcode = true,
            parser = require("lint.parser").from_errorformat([[%f:%l:%c %m]], {
                source = "taplo",
                severity = vim.diagnostic.severity.WARN
            })
        }

        -- Configure linters by filetype
        lint.linters_by_ft = {
            -- TypeScript & JavaScript
            typescript = {"eslint"},
            javascript = {"eslint"},
            typescriptreact = {"eslint"},
            javascriptreact = {"eslint"},

            -- CSS & HTML
            css = {"stylelint"},
            html = {"stylelint"},

            -- JSON
            json = {"jsonlint"},

            -- Lua
            lua = {"luacheck"},

            -- Markdown
            markdown = {"markdownlint"},

            -- Shell & Bash
            sh = {"shellcheck"},
            bash = {"shellcheck"},

            -- Swift
            swift = {"swiftlint"},

            -- Other languages
            yaml = {"yamllint"},
            toml = {"taplo"},
            sql = {"checkstyle"}
        }

        -- Ensure linters are installed via Mason
        local mason_active, mason_registry = pcall(require, "mason-registry")
        if mason_active then
            local tools = {"eslint_d", "stylelint", "jsonlint", "luacheck", "markdownlint", "shellcheck", "swiftlint",
                           "checkstyle", "yamllint", "taplo"}
            for _, tool in ipairs(tools) do
                if not mason_registry.is_installed(tool) then
                    mason_registry.get_package(tool):install()
                end
            end
        end

        -- Autocommands to trigger linting on relevant events
        local lint_augroup = vim.api.nvim_create_augroup("lint", {
            clear = true
        })
        vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave", "TextChanged"}, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end
        })
    end
}
