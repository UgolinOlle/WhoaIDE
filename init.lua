if vim.loader and vim.fn.has "nvim-0.9.1" == 1 then vim.loader.enable() end

vim.g.start_time = vim.fn.reltime()
vim.g.border = {
  enabled = true,
  style = "rounded",
  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
}

vim.cmd [[ 
  hi PmenuSel guibg=NONE guifg=#F2E2C3
  hi Pmenu guibg=NONE guifg=#FFFFFF
  hi NormalFloat guibg=#00000080
  hi FloatBorder guibg=NONE guifg=#F2E2C3

  hi TelescopeNormal guibg=NONE guifg=NONE
  hi TelescopeBorder guifg=#2E3440 guibg=NONE
  hi TelescopePromptNormal guibg=NONE
  hi TelescopePromptBorder guifg=#2E3440 guibg=NONE
  hi TelescopeResultsNormal guibg=NONE
  hi TelescopeResultsBorder guifg=#2E3440 guibg=NONE
  hi TelescopePreviewNormal guibg=NONE
  hi TelescopePreviewBorder guifg=#2E3440 guibg=NONE
]]

for _, source in ipairs {
  "whoa.options",
  "whoa.mappings",
  "whoa.lazy",
  -- "whoa.commands",
  "whoa.core",
} do
  local active, fault = pcall(require, source)
  if not active then vim.api.nvim_err_writeln("An error occured, failed to load " .. source .. "\n\n" .. fault) end
end
