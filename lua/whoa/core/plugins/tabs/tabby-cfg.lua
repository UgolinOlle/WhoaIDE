local util = require "tabby.util"

-- Get Vercel theme colors
local vercel_colors = require("vercel.colors").getColors(vim.o.background)

-- Extract highlight groups with Vercel theme fallbacks
local function safe_extract_hl(group, fallback)
  local ok, hl = pcall(util.extract_nvim_hl, group)
  if ok and hl then return hl end
  return fallback or { fg = vercel_colors.foreground, bg = vercel_colors.background }
end

local hl_tabline_fill =
  safe_extract_hl("lualine_c_normal", { fg = vercel_colors.foreground, bg = vercel_colors.background })
local hl_tabline = safe_extract_hl("lualine_b_normal", { fg = vercel_colors.foreground, bg = vercel_colors.popup })
local hl_tabline_sel = safe_extract_hl("lualine_a_normal", { fg = vercel_colors.background, bg = vercel_colors.blue })

local function tab_label(tabid, active)
  local icon = active and " " or " "
  local number = vim.api.nvim_tabpage_get_number(tabid)
  local name = util.get_tab_name(tabid)
  return string.format(" %s %d: %s ", icon, number, name)
end

local presets = {
  hl = "lualine_c_normal",

  layout = "tab_only",

  head = {
    { "", hl = { fg = hl_tabline_sel.bg } },
    { " 󰘳  ", hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg } },
    { " ", hl = { fg = hl_tabline_sel.bg } },
  },

  active_tab = {
    label = function(tabid)
      return {
        tab_label(tabid, true),
        hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg },
      }
    end,
    left_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    right_sep = { "", hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
  },

  inactive_tab = {
    label = function(tabid)
      return {
        tab_label(tabid, false),
        hl = { fg = hl_tabline.fg },
      }
    end,
    left_sep = { " ", hl = { fg = hl_tabline.fg, bg = hl_tabline_fill.bg } },
    right_sep = { " ", hl = { fg = hl_tabline.fg, bg = hl_tabline_fill.bg } },
  },
}

return presets
