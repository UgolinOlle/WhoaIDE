return {
    "stevearc/conform.nvim",

    name = "Conform",

    event = {"BufReadPre", "BufNewFile"},

    dependencies = {"williamboman/mason.nvim"},

    -- List of formatters to ensure are installed via Mason
    formatters_to_install = {"prettier", "stylua", "shfmt", "swiftformat", "sql_formatter"},

    config = function(self)
        -- Check if Conform is active
        local active, conform = pcall(require, "conform")
        if not active then
            return
        end

        -- Setup Conform
        conform.setup {
            formatters_by_ft = {
                -- TypeScript & JavaScript
                typescript = {"prettier"},
                javascript = {"prettier"},
                typescriptreact = {"prettier"},
                javascriptreact = {"prettier"},

                -- CSS & HTML
                css = {"prettier"},
                html = {"prettier"},

                -- JSON
                json = {"prettier"},

                -- Lua
                lua = {"stylua"},

                -- Markdown
                markdown = {"prettier"},

                -- Shell & Bash
                sh = {"shfmt"},
                bash = {"shfmt"},

                -- Swift
                swift = {"swiftformat"},

                -- Other languages
                yaml = {"prettier"},
                toml = {"prettier"},
                sql = {"sql_formatter"}
            },

            -- Automatically format on save
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 2500
            }
        }

        -- Ensure formatters are installed via Mason
        local mason_active, mason_registry = pcall(require, "mason-registry")
        if mason_active then
            for _, tool in ipairs(self.formatters_to_install) do
                local ok, p = pcall(mason_registry.get_package, tool)
                if ok and not p:is_installed() then
                    p:install()
                end
            end
        end
    end,

    -- Key mappings
    keys = {{"<LEADER>ci", "<CMD>ConformInfo<CR>", {
        noremap = true,
        silent = true,
        desc = "Show informations about Conform"
    }}}
}
