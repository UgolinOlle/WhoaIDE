return {
    "akinsho/toggleterm.nvim",
    name = "Toggle Terminal",
    event = "BufReadPre",
    version = "main",
    cmd = "ToggleTerm",

    -- Plugin options
    opts = {
        float_opts = {
            border = "curved"
        }
    },

    -- Plugin mappings
    keys = {{"<LEADER>tt", "<CMD>ToggleTerm<CR>", {
        noremap = true,
        silent = true,
        desc = "Toggle terminal"
    }}, {"<LEADER>th", "<CMD>ToggleTerm direction=horizontal<CR>", {
        noremap = true,
        silent = true,
        desc = "Toggle horizontal terminal"
    }}, {"<LEADER>tf", "<CMD>ToggleTerm direction=float<CR>", {
        noremap = true,
        silent = true,
        desc = "Toggle floating terminal"
    }}}
}
