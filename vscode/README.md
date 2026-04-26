# 💻 VS Code / Windsurf - Optimized Settings

## 📋 Overview

This directory contains VS Code/Windsurf configurations, extensions, and customizations optimized for modern development with C#/.NET, Angular, and Gemini API integration.

## 🎯 Main Focus

- **C#/.NET**: Complete development with Entity Framework, Blazor, and tests
- **Angular**: Modern frontend with TypeScript and Tailwind CSS
- **Gemini API**: Integration with GitHub Copilot and advanced AI
- **Productivity**: Tools for agile and collaborative development
- **Quality**: Code quality, formatting, and static analysis

## 📁 Directory Structure

```
vscode/
├── README.md                    # This file - complete guide
├── settings.json                # Optimized global settings
├── extensions.json              # Recommended extensions by category
├── keybindings.json             # Custom C#/.NET shortcuts
└── install-extensions.sh        # Automatic installation script
```

## 🚀 Main Settings

### settings.json - Hardware Optimizations

**Detected Hardware**: 16 cores · 25.4 GB RAM  
**GPUs**: Intel Iris Xe; NVIDIA GeForce RTX 2050

#### 🎨 Editor & Performance
- **Automatic formatting** on save with default C# formatter
- **Bracket pair colorization** for better code readability
- **Smooth cursor animations** (GPU acceleration)
- **Minimap** enabled for quick navigation
- **Smooth scrolling** in lists and editor
- **Large file optimizations** for files >2MB

#### 💾 Memory & Resources
- **Max memory for large files**: 3072MB (appropriate for 24GB RAM)
- **Editor limit**: 20 simultaneous tabs
- **Tab limit**: 20 tabs (balance for 24GB RAM)
- **File watcher exclusions** to reduce I/O

#### 🔧 Terminal & Shell
- **Default profile**: PowerShell (Windows)
- **GPU acceleration**: ON (better visual performance)
- **Scrollback**: 5000 lines (2MB per terminal)
- **WSL integration** for Linux development

#### 🌐 Network & Timeout
- **System certificates V2**: SSL/HTTPS fix
- **HTTP timeout**: 120s (2 minutes)
- **Auto-update extensions**: enabled

## 📦 Extensions Organized by Category

### 🚀 AI & Code Completion
- **GitHub Copilot**: Advanced code completion
- **GitHub Copilot Chat**: Conversational AI assistant
- **Intellicode**: Context-based suggestions

### 💻 C# / .NET Development
- **C# Dev Kit**: Complete .NET development
- **Blazor**: Web components framework
- **Dotnet Runtime**: Integrated .NET runtime
- **Dotnet Core Snippets**: .NET snippets
- **Dotnet Pack**: .NET extension pack
- **Test Explorer**: Integrated unit tests

### 🌐 Web Development (Angular & Frontend)
- **Angular Extension**: Angular templates and snippets
- **John Papa Angular**: Angular best practices
- **TypeScript Next**: Complete TS/JS support
- **Tailwind CSS**: Utility-first CSS framework
- **HTML CSS Support**: Formatting and snippets
- **Jest**: JavaScript testing framework
- **Auto Rename Tag**: Rename HTML tags in pairs
- **Auto Close Tag**: Close tags automatically

### 🐳 Docker & Containers
- **Docker Extension**: Container management

### 🔧 Git & Version Control
- **GitLens**: Git superpowers
- **GitHub Pull Requests**: GitHub integration
- **GitIgnore**: .gitignore management

### 🗄️ Database & Data
- **SQL Server**: Microsoft SQL integration
- **REST Client**: API testing

### 🎨 Code Quality & Formatting
- **Prettier**: Code formatting
- **EditorConfig**: Consistent settings

### 📋 Productivity & Utilities
- **Path Intellisense**: Path autocomplete
- **NPM Intellisense**: NPM package autocomplete
- **Bracket Pair Colorizer**: Colors for bracket pairs

## 🎨 Themes & Customization

### Recommended Themes
- **Material Icon Theme**: Modern icons
- **VSCode Icons**: Official VS Code icons

### Editor Themes
The project includes icon extensions for better visualization, but editor themes are optional and can be installed according to personal preference.

## 🔧 Custom Shortcuts (keybindings.json)

### C# Development
- `Ctrl+Shift+C`: Generate async method
- `Ctrl+Shift+T`: Run tests in context
- `Ctrl+Shift+D`: Debug tests in context
- `Ctrl+Shift+F`: Format document

### GitHub Copilot
- `Ctrl+L`: Quick chat
- `Ctrl+I`: Edit with input
- `Ctrl+Shift+\`: Focus Copilot input

### Terminal & Navigation
- `Ctrl+``: Toggle terminal
- `Ctrl+Shift+``: Split terminal
- `Ctrl+Shift+E`: Explorer
- `Ctrl+Shift+P`: Command palette

## 🧪 Testing & Debug

### Test Settings
- **xUnit Integration**: .NET unit tests
- **Test Explorer**: Visual test interface
- **Code Coverage**: Coverage analysis
- **Test Adapters**: Framework integration

### Debug Configuration
- **.NET Launch**: Web application debugging
- **Docker Debug**: Container debugging
- **Attach**: Attach to existing processes

## 🌐 Web Development Setup

### Angular Configuration
```json
{
  "angular.ng-template": true,
  "typescript.preferences.includePackageJsonAutoImports": "on"
}
```

### Tailwind CSS
```json
{
  "tailwindCSS.includeLanguages": ["html", "typescript", "javascript"],
  "tailwindCSS.experimental.classRegex": ["clsx\\(([^)]*)\\)"]
}
```

### Live Server
```json
{
  "liveServer.settings.port": 5500,
  "liveServer.settings.root": "/src"
}
```

## 🐳 Docker Integration

### Docker Compose
- **Syntax highlighting** for docker-compose.yml
- **IntelliSense** for Dockerfiles
- **Integrated container management**
- **Remote development** in containers

### Settings
```json
{
  "docker.extension.enableComposeLanguageServer": true,
  "docker.images.defaultRegistry": "docker.io"
}
```

## 🔧 Advanced Git Integration

### GitLens Features
- **Code Lens**: Inline commit information
- **File History**: Change history
- **Repository Graph**: Branch visualization
- **Blame Annotations**: Code authorship

### GitHub Integration
- **Pull Requests**: PR creation and review
- **GitHub Actions**: Workflow integration
- **Issues**: Issue management

## 🎯 Productivity Tips

### Custom Snippets
- **ASP.NET Core Controller**: `controller`
- **Repository Pattern**: `repository`
- **xUnit Unit Test**: `test`
- **Angular Component**: `component`

### Workspace Management
- **Multi-root workspaces**: Related projects
- **Folder nesting**: File grouping
- **File exclusions**: Focus on relevant code

## 🚀 Performance Optimization

### For 24GB RAM
- **Editor limit**: 20 open files
- **Large files**: 3GB memory allocation
- **Terminal history**: 5000 lines
- **Search results**: 15000 items

### For 16 Cores CPU
- **Background analysis**: 3 .NET projects
- **Type checking**: Basic mode
- **Auto-imports**: Enabled (with spare CPU)

## 🔒 Security & Privacy

### Settings
- **Workspace trust**: Enabled with caution
- **Telemetry**: Disabled (optional)
- **Certificate validation**: System certificates V2
- **Secure connections**: HTTPS by default

## 📚 Additional Documentation

- [.NET Setup Guide](https://docs.microsoft.com/en-us/dotnet/core/)
- [Angular Documentation](https://angular.io/docs)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Git Workflow](https://github.com/features/codespaces)

## 🔄 Automatic Installation

```bash
# Windows
./install-extensions.bat

# Linux/macOS  
./install-extensions.sh
```

## 🎉 Benefits

✅ **Focused development** C#/.NET + Angular  
✅ **AI integration** with GitHub Copilot  
✅ **Optimized extensions** for quick development  
✅ **Quality tools** for clean code  
✅ **Docker integration** for containerization  
✅ **Advanced Git** for collaboration  
✅ **Lean setup** with only essential extensions  

---

**Complete setup for modern development!** 🚀

Configured to extract the maximum from your hardware with professional tools.
