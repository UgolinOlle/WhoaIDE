return {
    "yetone/avante.nvim",
    event = {"BufReadPre", "BufNewFile"},
    version = false,
    build = "make",

    -- Dependencies
    dependencies = {{
        "nvim-treesitter/nvim-treesitter",
        name = "Nvim Treesitter",
        event = "BufReadPre",
        lazy = true
    }, {
        "stevearc/dressing.nvim",
        name = "Dressing",
        event = "VeryLazy",
        lazy = true
    }, {
        "nvim-lua/plenary.nvim",
        name = "Plenary",
        lazy = true
    }, {
        "MunifTanjim/nui.nvim",
        name = "Nui",
        lazy = true
    }, {
        "nvim-tree/nvim-web-devicons",
        name = "Nvim Web Devicons",
        lazy = true
    }},

    -- Plugin
    opts = {
        provider = "copilot"
    }
}
