#!/bin/bash
# Setup husky git hooks for linting and commit message validation

echo "🔧 Setting up husky git hooks..."

# Install npm dependencies
echo "📦 Installing dependencies..."
npm install

# Initialize husky
echo "🐶 Initializing husky..."
npx husky install

# Create pre-commit hook
echo "✨ Creating pre-commit hook..."
npx husky add .husky/pre-commit "npx lint-staged"

# Create commit-msg hook  
echo "📝 Creating commit-msg hook..."
npx husky add .husky/commit-msg "npx commitlint --edit \$1"

echo "✅ Husky setup complete!"
echo ""
echo "📝 Make sure to install linting tools:"
echo "  brew install stylua"
echo "  brew install luarocks && luarocks install luacheck"
echo ""
echo "🎉 Your commits will now be automatically linted!"