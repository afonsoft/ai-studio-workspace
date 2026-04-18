# 🔧 Git Configuration

## Basic Git Setup

### User Configuration
```bash
# Set your name
git config --global user.name "Your Name"

# Set your email
git config --global user.email "your.email@example.com"
```

### Core Settings
```bash
# Enable long paths (Windows)
git config --global core.longpaths true

# Set default branch name to main
git config --global init.defaultBranch main

# Enable autocrlf (Windows)
git config --global core.autocrlf true

# Set line ending to LF (Linux/macOS)
git config --global core.autocrlf input
```

### SSL Configuration (for corporate proxies)
```bash
# Disable SSL verification (use with caution)
git config --global http.sslVerify false
git config --global https.sslVerify false
```

### Performance Settings
```bash
# Increase file watcher limit (Linux/macOS)
git config --global core.fsmonitor true

# Set compression level (0-9, 9 is best compression)
git config --global core.compression 9

# Enable delta compression
git config --global pack.deltaCacheSize 512m
```

### Alias Settings
```bash
# Common aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.visual '!gitk'
```

### Editor Configuration
```bash
# Set default editor to VS Code
git config --global core.editor "code --wait"

# Or set to nano
git config --global core.editor "nano"

# Or set to vim
git config --global core.editor "vim"
```

### Merge Configuration
```bash
# Set merge tool
git config --global merge.tool vscode

# Set diff tool
git config --global diff.tool vscode
```

## NPM Configuration

### SSL Configuration
```bash
# Disable strict SSL (use with caution)
npm config set strict-ssl false

# Set custom registry (optional)
npm config set registry https://registry.npmjs.org/
```

### Environment Variables
```bash
# Disable TLS verification (use with caution)
export NODE_TLS_REJECT_UNAUTHORIZED=0
```

## Verification

Check your configuration:
```bash
# List all git configuration
git config --list

# Check specific setting
git config --global user.name
git config --global user.email

# Check git version
git --version
```

## Security Notes

⚠️ **Warning**: Disabling SSL verification (`http.sslVerify false`, `strict-ssl false`) should only be used in development environments or when behind a corporate proxy with trusted certificates. Do not use these settings in production or when connecting to public repositories.

## Recommended Configuration for Development

```bash
# Basic setup
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global core.longpaths true
git config --global init.defaultBranch main
git config --global core.autocrlf true

# Editor
git config --global core.editor "code --wait"

# Aliases
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
```
