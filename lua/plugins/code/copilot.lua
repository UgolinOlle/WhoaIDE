return {
    "zbirenbaum/copilot.lua",
    name = "Copilot",
    event = "InsertEnter",

    -- Plugin options
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = "<TAB>",
                accept_line = "<S-TAB>",
                next = "<C-]>",
                prev = "<C-[>",
                dismiss = "<ESC>"
            }
        },
        panel = {
            enabled = false
        }
    },

    -- Plugin configuration
    config = function(_, opts)
        require("copilot").setup(opts)
    end
}
