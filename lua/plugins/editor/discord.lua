return {
    "IogaMaster/neocord",

    name = "Neocord",

    event = "VeryLazy",

    -- Plugin configuration
    config = function()
        require("neocord").setup {
            client_id = "1287732244835733576"
        }
    end
}
