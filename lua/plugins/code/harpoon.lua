return {
    "ThePrimeagen/harpoon",
    name = "Harpoon",
    enabled = true, -- Easily disable if needed
    event = {"BufReadPre", "BufWritePre"},
    branch = "harpoon2",

    dependencies = {{
        "nvim-lua/plenary.nvim",
        name = "Plenary",
        lazy = true
    }, {
        "nvim-telescope/telescope.nvim",
        name = "Telescope",
        lazy = true
    }},

    config = function()
        -- Import & check if harpoon is available
        local status_ok, harpoon = pcall(require, "harpoon")
        if not status_ok then
            return
        end

        -- Harpoon configuration
        harpoon.setup({
            global_settings = {
                save_on_toggle = false,
                save_on_change = true,
                enter_on_sendcmd = false,
                tmux_autoclose_windows = false,
                excluded_filetypes = {"harpoon"}
            }
        })

        -- Telescope integration for Harpoon
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({})
            }):find()
        end

        -- Key mappings (can be moved to a `keys` field if supported by your loader)
        local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, {
                noremap = true,
                silent = true,
                desc = desc
            })
        end

        map("<LEADER>a", function()
            harpoon:list():add()
        end, "Add file to Harpoon")
        map("<C-e>", function()
            toggle_telescope(harpoon:list())
        end, "Open Harpoon with Telescope")
        map("<C-1>", function()
            harpoon:list():select(1)
        end, "Go to file 1")
        map("<C-2>", function()
            harpoon:list():select(2)
        end, "Go to file 2")
        map("<C-3>", function()
            harpoon:list():select(3)
        end, "Go to file 3")
        map("<C-4>", function()
            harpoon:list():select(4)
        end, "Go to file 4")
    end
}
