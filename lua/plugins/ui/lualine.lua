return {
  "nvim-lualine/lualine.nvim",

  name = "Lualine",

  event = { "BufReadPost", "BufNewFile" },

  dependencies = { "nvim-tree/nvim-web-devicons", name = "Web Devicons", lazy = true },

  config = function(_, opts)
    -- Variables
    local get_icons = require("whoa.core.utils").get_icons
    local vercel_colors = require("vercel.colors").getColors(vim.o.background)

    -- Create custom smooth Vercel theme for lualine
    local vercel_theme = {
      normal = {
        a = { fg = vercel_colors.background, bg = vercel_colors.blue },
        b = { fg = vercel_colors.blue, bg = vercel_colors.popup },
        c = { fg = vercel_colors.foreground, bg = "NONE" },
      },
      insert = {
        a = { fg = vercel_colors.background, bg = vercel_colors.green },
        b = { fg = vercel_colors.green, bg = vercel_colors.popup },
      },
      visual = {
        a = { fg = vercel_colors.background, bg = vercel_colors.purple },
        b = { fg = vercel_colors.purple, bg = vercel_colors.popup },
      },
      command = {
        a = { fg = vercel_colors.background, bg = vercel_colors.orange },
        b = { fg = vercel_colors.orange, bg = vercel_colors.popup },
      },
      replace = {
        a = { fg = vercel_colors.background, bg = vercel_colors.red },
        b = { fg = vercel_colors.red, bg = vercel_colors.popup },
      },
      inactive = {
        a = { fg = vercel_colors.secondary, bg = "NONE" },
        b = { fg = vercel_colors.secondary, bg = "NONE" },
        c = { fg = vercel_colors.secondary, bg = "NONE" },
      },
    }
    local mode_icons = {
      ["n"] = get_icons "Normal" .. " ",
      ["i"] = get_icons "Insert" .. " ",
      ["v"] = get_icons "Visual" .. " ",
      ["V"] = get_icons "VisualLine" .. " ",
      ["c"] = get_icons "Command" .. " ",
      ["r"] = get_icons "Replace" .. " ",
      ["t"] = get_icons "Terminal" .. " ",
    }

    --- Get the current mode
    local mode = function()
      local mode = vim.fn.mode()
      return mode_icons[mode] or "Unknown"
    end

    --- Setup LSP Diagnostics for lualine
    local diagnostics = {
      "diagnostics",
      sources = { "nvim_lsp" },
      sections = { "error", "warn", "info", "hint" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      colored = true,
      always_visible = false,
    }

    --- Setup filename for lualine
    local filename = {
      "filename",
      file_status = true,
      path = 1, -- Show relative path
      symbols = { modified = " ●", readonly = " ", unnamed = " [No Name]" },
    }

    --- Get the number of words in the current buffer
    local getWords = function()
      local words = vim.fn.wordcount().words
      return string.format(get_icons "WordFile" .. "  %d", words)
    end

    opts.sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_b = { "filename", "branch" },
      lualine_c = { "%=" },
      lualine_x = {},
      lualine_y = { { getWords, right_padding = 1 }, "encoding", "filetype" },
      lualine_z = {
        { "location", separator = { right = "" }, left_padding = 2 },
      },
    }

    opts.options.theme = vercel_theme
    require("lualine").setup(opts)
  end,

  opts = {
    options = {
      icons_enabled = true,
      always_divide_middle = true,
      component_separators = "",
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
  },
}
