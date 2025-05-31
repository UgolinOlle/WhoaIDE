return {
    "luckasRanarison/nvim-devdocs",

    name = "Devdocs",

    event = "BufReadPost",

    -- Required dependencies
    dependencies = {{
        "nvim-lua/plenary.nvim",
        name = "Plenary",
        lazy = true
    }, {
        "nvim-telescope/telescope.nvim",
        name = "Telescope",
        lazy = true
    }, {
        "nvim-treesitter/nvim-treesitter",
        name = "Nvim Treesitter",
        lazy = true
    }},

    -- Available commands
    cmd = {"DevdocsFetch", "DevdocsInstall", "DevdocsUninstall", "DevdocsOpen", "DevdocsOpenFloat",
           "DevdocsOpenCurrent", "DevdocsOpenCurrentFloat", "DevdocsUpdate", "DevdocsUpdateAll", "DevdocsBuild"},

    -- Plugin options
    opts = {
        format = "markdown",
        ensure_installed = {"css", "html", "javascript", "lua", "react", "typescript", "c", "cpp", "git", "php", "twig"},
        wrap = true,
        previewer_cmd = "glow",
        cmd_args = {"-s", "auto", "-w", "97"},
        cmd_ignore = {},
        picker_cmd = true,
        picker_cmd_args = {"-s", "auto", "-w", "45"}
    },

    -- Key mappings
    keys = {{
        "<LEADER>dd",
        "<CMD>DevdocsOpen<CR>",
        desc = "Open DevDocs",
        noremap = true,
        silent = true
    }, {
        "<LEADER>ds",
        "<CMD>DevdocsOpenCurrentFloat<CR>",
        desc = "Open current doc in float",
        noremap = true,
        silent = true
    }}
}
