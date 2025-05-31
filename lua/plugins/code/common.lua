return { -- Icon Picker: Insert and yank NerdFont icons
{
    "ziontee113/icon-picker.nvim",
    name = "Icon Picker",
    lazy = true,
    opts = {
        disable_legacy_commands = true
    },
    keys = {{
        "<C-i>",
        "<CMD>IconPickerInsert<CR>",
        desc = "Open icon picker",
        noremap = true,
        silent = true
    }, {
        "<LEADER>y",
        "<CMD>IconPickerYank<CR>",
        desc = "Yank icon",
        noremap = true,
        silent = true
    }, {
        "<LEADER>i",
        "<CMD>IconPickerNormal<CR>",
        desc = "Normal icon picker",
        noremap = true,
        silent = true
    }}
}, -- Plenary: Lua utility functions (required by many plugins)
{
    "nvim-lua/plenary.nvim",
    name = "Plenary",
    lazy = false
}, -- Auto Pairs: Automatic closing of brackets, quotes, etc.
{
    "windwp/nvim-autopairs",
    name = "Auto Pairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
        ts_config = {
            java = false
        }
    }
}, -- Comment.nvim: Quick commenting, with Treesitter context support
{
    "numToStr/Comment.nvim",
    name = "Comment",
    event = "BufReadPre",
    opts = function()
        local ok, comment_string = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
        return ok and comment_string and {
            pre_hook = comment_string.create_pre_hook()
        } or {}
    end
}, -- Render Markdown: Markdown preview in Neovim
{
    "MeanderingProgrammer/render-markdown.nvim",
    name = "Render Markdown",
    lazy = true,
    dependencies = {{
        "nvim-treesitter/nvim-treesitter",
        name = "Nvim Treesitter",
        lazy = true
    }, {
        "nvim-tree/nvim-web-devicons",
        name = "Web DevIcons",
        lazy = true
    }}
    -- ft = { "markdown", "Avante" },
}, -- Align: Text alignment for code and tables
{
    "RRethy/nvim-align",
    name = "Align",
    event = "BufReadPre"
}}
