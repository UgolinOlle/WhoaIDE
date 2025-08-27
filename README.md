<p align="center">
    <img src="./.github/assets/banner.png" alt="Whoa IDE Banner">
</p>

<h1 align="center">🚀 Whoa IDE</h1>

<p align="center">
    <em>A modern, feature-rich Neovim configuration built for productivity and performance</em>
</p>

<p align="center">
    <img alt="Neovim" src="https://img.shields.io/badge/Neovim-0.9+-57A143?style=for-the-badge&logo=neovim&logoColor=white">
    <img alt="Lua" src="https://img.shields.io/badge/Lua-5.1+-2C2D72?style=for-the-badge&logo=lua&logoColor=white">
    <img alt="License" src="https://img.shields.io/badge/License-MIT-blue?style=for-the-badge">
</p>

---

## ✨ Features

### 🎨 **Modern UI & Themes**
- **Multiple Theme Options**: GitHub, Solarized Osaka, VSCode, Vercel themes
- **Smart Status Line**: Lualine with custom configurations
- **File Tree**: Neo-tree with advanced file management
- **Tabline**: Tabby for elegant tab management
- **Notification System**: Noice for enhanced UI notifications
- **Icon Support**: Web devicons and Nerdfont integration

### 🧠 **Intelligent Code Assistance**
- **LSP Integration**: Full Language Server Protocol support via nvim-lspconfig
- **Auto-completion**: Comprehensive completion with nvim-cmp
  - Buffer completion
- Path completion
  - LSP completion
  - LuaSnip integration
  - Emoji and Nerdfont support
  - Treesitter completion
- **AI-Powered Coding**: GitHub Copilot and Avante.nvim integration
- **Code Formatting**: Conform.nvim for consistent code style
- **Linting**: nvim-lint for real-time code analysis

### 🔍 **Advanced Search & Navigation**
- **Telescope**: Fuzzy finder with multiple extensions
  - File finder with exclusions
  - Live grep with ripgrep
  - Node modules search
  - Symbol search
  - Software licenses
- **Harpoon**: Quick file navigation
- **Outline**: Symbol outline for code structure
- **GrugFar**: Advanced find and replace
- **Dropbar**: Breadcrumb navigation

### 🛠️ **Developer Tools**
- **Git Integration**: 
  - Fugit2 for Git operations
  - GitSigns for inline git info
  - Git blame and diff view
  - TinyGit for streamlined workflows
- **Terminal**: Integrated terminal with ToggleTerm
- **Debugging**: Built-in debugging capabilities
- **Documentation**: DevDocs integration
- **Todo Management**: Todo-comments for project todos
- **Markdown Support**: Enhanced markdown editing and preview

### ⚡ **Performance & Productivity**
- **Lazy Loading**: Lazy.nvim plugin manager for fast startup
- **Treesitter**: Advanced syntax highlighting and code understanding
- **Autopairs**: Intelligent bracket pairing
- **Surround**: Easy text surrounding operations
- **Comment**: Smart commenting system
- **Which-Key**: Interactive keybinding helper
- **Garbage Collection**: Optimized memory management
- **Custom Features**:
  - Autosave functionality
  - LSP diagnostics
  - Highlight on yank
  - Spell check for Markdown

### 🎮 **Gaming & Fun**
- **Discord Integration**: Rich presence with Neocord
- **Hack The Box**: CTF and security challenges integration
- **WakaTime**: Coding time tracking
- **Zen Mode**: Distraction-free coding

## 🚀 Installation

### Prerequisites
- **Neovim 0.9.1+** 
- **Git**
- **Node.js** (for LSP servers)
- **Ripgrep** (for telescope live grep)
- **A Nerd Font** (for icons)

### Quick Install
```bash
# Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.backup

# Clone Whoa IDE
git clone https://github.com/your-username/whoa-ide ~/.config/nvim

# Start Neovim - plugins will install automatically
nvim
```

## 🔧 Configuration

### Core Structure
```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin versions lock file
├── lua/
│   ├── plugins/            # Plugin configurations
│   │   ├── code/          # Coding-related plugins
│   │   ├── editor/        # Editor enhancements
│   │   ├── lsp/           # Language server configs
│   │   └── ui/            # UI and theme plugins
│   ├── snippets/          # Custom snippets
│   └── whoa/              # Core Whoa IDE modules
│       ├── commands.lua   # Custom commands
│       ├── configs/       # Feature configurations
│       ├── core/          # Core functionality
│       ├── lazy.lua       # Plugin manager setup
│       ├── mappings.lua   # Key mappings
│       └── options.lua    # Neovim options
└── user/                  # User-specific configs
    └── main.lua           # User customizations
```

### Customization

#### User Configuration
Create or modify `user/main.lua` to customize your setup:

```lua
-- user/main.lua
return {
  -- Your custom configurations
  theme = "github_dark",
  features = {
    autosave = true,
    spell_check = true,
  },
  -- Custom keymaps
  keymaps = {},
}
```

#### Features Toggle
Modify `lua/whoa/configs/features.lua`:

```lua
return {
  Autosave = true,                    -- Auto-save files
  LSP_Diagnostics = true,            -- Show LSP diagnostics
  Highlight_on_Yank = true,          -- Highlight yanked text
  Spell_Check_for_Markdown = true,   -- Spell check in markdown
}
```

## 📦 Plugin Management

Whoa IDE uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

### Common Commands
- `:Lazy` - Open plugin manager
- `:Lazy update` - Update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy profile` - Show startup profiling

## ⌨️ Key Mappings

### General
- `<leader>` - Space (main leader key)
- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers

### Code
- `<leader>ca` - Code actions
- `<leader>cf` - Format code
- `<leader>cr` - Rename symbol
- `gd` - Go to definition
- `gr` - Go to references

### Git
- `<leader>gg` - Open Git interface
- `<leader>gb` - Git blame
- `<leader>gd` - Git diff

*For complete keybinding reference, press `<leader>` in Neovim to see Which-Key popup.*

## 🏗️ Development

### Adding New Plugins
1. Create a new file in the appropriate `lua/plugins/` subdirectory
2. Follow the lazy.nvim plugin specification
3. Restart Neovim to load the new plugin

### Custom Commands
Add custom commands in `lua/whoa/commands.lua`.

### Themes
Themes are configured in `lua/plugins/ui/themes.lua`. To add a new theme:
1. Add the theme plugin
2. Configure it in the themes file
3. Update the theme selection logic

## 🐛 Troubleshooting

### Common Issues
1. **Slow startup**: Run `:Lazy profile` to identify slow plugins
2. **LSP not working**: Check `:LspInfo` and ensure language servers are installed
3. **Icons not showing**: Install a Nerd Font and set it in your terminal
4. **Telescope errors**: Ensure ripgrep is installed

### Health Checks
Run `:checkhealth` to diagnose common issues.

### Logs
Check logs in `user/logs/actions.log` for debugging information.

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

### Development Setup
```bash
# Clone your fork
git clone https://github.com/your-username/whoa-ide
cd whoa-ide

# Create a feature branch
git checkout -b feature/your-feature-name

# Make changes and test
# Submit PR
```

## 📄 License

This project is licensed under the [MIT License](./LICENSE).

## 📧 Contact

- **Email**: [hello@ugolin-olle.com](mailto:hello@ugolin-olle.com)
- **LinkedIn**: [ugolin-olle](https://linkedin.com/in/ugolin-olle)
- **GitHub**: [Report Issues](https://github.com/your-username/whoa-ide/issues)

---

<p align="center">
    <em>Built with ❤️ and Neovim</em>
</p>