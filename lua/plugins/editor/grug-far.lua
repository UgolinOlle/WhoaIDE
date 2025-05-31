return {
    "MagicDuck/grug-far.nvim",
    name = "GrugFar",
    event = {"BufRead", "BufNewFile"},

    -- Plugin options
    opts = {
        resultsSeparatorLineChar = "-",
        spinnerStates = {"", "", "", ""},
        startInInsertMode = false,

        icons = {
            resultsStatusReady = " ",
            resultsStatusError = " ",
            resultsStatusSuccess = " ",
            resultsActionMessage = "  ",
            resultsChangeIndicator = "│",
            historyTitle = "  "
        },

        engines = {
            ripgrep = {
                placeholders = {
                    enabled = false
                }
            }
        },

        disableBufferLineNumbers = true
    },

    -- Key mappings
    keys = {{
        "<leader>gf",
        function()
            require("grug-far").grug_far {}
        end,
        desc = "GrugFar",
        noremap = true,
        silent = true,
        mode = "n"
    }, {
        "<leader>gf",
        function()
            require("grug-far").with_visual_selection {
                prefills = {
                    search = vim.fn.expand "<cword>",
                    filesFilter = vim.fn.expand "%"
                }
            }
        end,
        desc = "GrugFar (visual)",
        noremap = true,
        silent = true,
        mode = "v"
    }}
}
