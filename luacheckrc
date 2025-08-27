-- Luacheck configuration for Neovim config
std = "luajit"
max_line_length = 120

-- Global variables
globals = {
  "vim",
  "describe",
  "it",
  "before_each",
  "after_each",
}

-- Ignore some common warnings
ignore = {
  "212", -- Unused argument
  "213", -- Unused loop variable
  "631", -- Line is too long
}

-- Files to exclude
exclude_files = {
  "lazy-lock.json",
  ".git/**",
  "node_modules/**",
}