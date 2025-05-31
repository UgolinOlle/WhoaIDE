return {
    "hedyhli/outline.nvim",
    name = "Outline",
    event = "BufReadPre",

    -- Plugin configuration
    config = function()
        require("outline").setup {}
    end,

    -- Key mappings
    keys = {{"<LEADER>o", "<CMD>Outline<CR>", {
        noremap = true,
        silent = true,
        desc = "Toggle Outline"
    }}}
}
