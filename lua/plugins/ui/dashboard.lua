return {
  "nvimdev/dashboard-nvim",

  name = "Dashboard",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  event = "VimEnter",

  config = function()
    local function key(shortcut)
      shortcut.icon_hl = shortcut.icon_hl or "Title"
      shortcut.desc_hl = shortcut.desc_hl or "String"
      shortcut.key_hl = shortcut.key_hl or "Keyword"
      return shortcut
    end

    require("dashboard").setup {
      theme = "doom",
      config = {
        center = {
          key {
            icon = " ",
            desc = "Whoa Agency",
            key = "1",
            action = function()
              require("telescope.builtin").find_files {
                prompt_title = "Select Folder",
                cwd = "~/Developer/whoa-agency",
              }
            end,
          },
          key {
            icon = " ",
            desc = "Configuration",
            key = "2",
            action = function() require("telescope.builtin").find_files { cwd = "~/.config" } end,
          },
          key {
            icon = "󰢱 ",
            desc = "Package manager",
            key = "3",
            action = "Lazy",
          },
        },
        footer = {
          "Made by WHOA ⨕ Ugolin Ollé",
        },
      },
    }
  end,
}
