local get_icons = require("whoa.utils").get_icons

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },

  config = function(_, opts)
    -- local vscode = require "lualine.themes.vscode"
    --
    -- local function make_bg_transparent(theme)
    --   for mode, sections in pairs(theme) do
    --     for section, properties in pairs(sections) do
    --       if section ~= "a" and section ~= "b" then
    --         properties.bg = "none"
    --       else
    --         properties.bg = vscode[mode][section].bg
    --       end
    --     end
    --   end
    --   return theme
    -- end
    --
    -- opts.options.theme = make_bg_transparent(vscode)

    local mode_actions = {
      ["n"] = get_icons "Normal",
      ["i"] = get_icons "Insert",
      ["v"] = get_icons "Visual",
      ["c"] = get_icons "Command",
      ["s"] = get_icons "Select",
      ["t"] = get_icons "Terminal",
    }

    local mode = function()
      local mode = vim.fn.mode()
      return mode_actions[mode] or mode
    end

    opts.options.sections = {
      lualine_a = { mode },
      lualine_b = { "branch" },
      lualine_c = { "filename" },
      lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    }
    require("lualine").setup(opts)
  end,

  opts = {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      component_separators = "│",
      section_separators = "",
      disabled_filetypes = {
        statusline = { "neo-tree" },
      },
    },
  },
}
