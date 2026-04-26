# 🚀 Setup VS Code + GitHub Copilot + OpenHands for .NET Development

## 📋 Requirements
- VS Code installed
- GitHub Copilot activated
- OpenHands configured with Gemini 3.1 Flash Lite Preview
- Recommended extensions for .NET

## ⚙️ Step 1: Configure VS Code + GitHub Copilot

### 1.1 Install GitHub Copilot Extension
1. In VS Code: `Ctrl+Shift+X` (Extensions)
2. Search: `GitHub Copilot`
3. Install the official extension
4. Login with your GitHub account

### 1.2 Configure Copilot for .NET
1. Open Settings: `Ctrl+,`
2. Configure for .NET development:
```json
{
  "github.copilot.enable": {
    "*": true,
    "csharp": true,
    "javascript": true,
    "typescript": true
  },
  "github.copilot.chat.provider": "copilot",
  "github.copilot.editor.enableAutoAcceptSuggestions": true,
  "github.copilot.editor.enableCodeActions": true
}
```

## 🤖 Step 2: Configure OpenHands with Gemini 3.1 Flash Lite Preview

### 2.1 Configure Environment Variables
Set your Google Gemini API key:

**Windows (PowerShell):**
```powershell
$env:GEMINI_API_KEY = "your-api-key-here"
```

**Linux/macOS:**
```bash
export GEMINI_API_KEY="your-api-key-here"
```

### 2.2 Build Custom Sandbox Image
First, build the custom sandbox image with .NET SDK 10:

```bash
# Build the custom sandbox image with .NET SDK 10
docker-compose --profile build build

# Ou build manual
docker build -t ai-studio-workspace ./runtime
```

### 2.3 Start OpenHands
**For maximum performance:**
```bash
docker-compose up -d openhands
```

**For limited resources:**
```bash
docker-compose -f docker-compose.low-resource.yml up -d openhands
```

### 2.4 Optimized Settings
OpenHands is configured with:
- **Model**: Gemini 3.1 Flash Lite Preview
- **Custom Sandbox**: Image `ai-studio-workspace` with .NET SDK 10
- **Sandbox Base**: nikolaik/python-nodejs:python3.12-nodejs22 (same as official agent-server)
- **Available Tools**: Python 3.12, Node.js 22, .NET SDK 10, git, sudo
- **Temperature**: 0.35 (performance) / 0.3 (low-resource)
- **Parallelism**: 3 (performance) / 2 (low-resource)
- **Memory Budget**: 4GB (performance) / 2GB (low-resource)
- **Timeouts**: Optimized for fast responses

### 1.3 Copy Configuration Files
Copy files from the `vscode/` folder of this repository:

#### 📁 Windows (PowerShell/CMD)
```powershell
# Copy VS Code settings
copy vscode\settings.json "%APPDATA%\Code\User\settings.json"

# Copy custom shortcuts
copy vscode\keybindings.json "%APPDATA%\Code\User\keybindings.json"

# Copy recommended extensions
copy vscode\extensions.json "%APPDATA%\Code\User\extensions.json"
```

#### 🐧 Linux/macOS (Bash/Zsh)
```bash
# Copy VS Code settings
cp vscode/settings.json ~/.config/Code/User/settings.json

# Copy custom shortcuts
cp vscode/keybindings.json ~/.config/Code/User/keybindings.json

# Copy recommended extensions
cp vscode/extensions.json ~/.config/Code/User/extensions.json
```

#### 📂 VSCode Folder File Structure
```
vscode/
├── settings.json              # Optimized settings for .NET
├── keybindings.json          # Custom shortcuts for C#/.NET
├── extensions.json           # Recommended extensions
├── install-extensions.sh     # Installation script Linux/macOS
├── install-extensions.bat    # Installation script Windows
└── README.md                 # Complete documentation
```

#### ⚡ Available Custom Commands
- `/refactor` - Refactor code following SOLID principles
- `/test` - Generate xUnit tests with Moq
- `/document` - Generate XML documentation
- `/optimize` - Optimize performance
- `/repository` - Create Repository pattern
- `/api` - Create Web API endpoints
- `/linq` - Convert to LINQ
- `/async` - Convert to async/await
- `/validate` - Add validation
- `/security` - Add security measures

#### 🎨 Context Providers
- `@codebase` - Complete project context
- `@file` - Current file
- `@directory` - Current directory

### 1.4 Verify Installation
After copying files:

1. **Restart VS Code** to load new settings
2. **Check Copilot**: Click Copilot icon in sidebar
3. **Test model**: `Ctrl+L` and type "Hello, are you working?"
4. **Check shortcuts**: `Ctrl+Shift+P` > "Preferences: Open Keyboard Shortcuts (JSON)"

### 1.5 Install Recommended Extensions

#### Option 1: Automatic Script (Recommended)
Use the appropriate script for your operating system:

**Windows:**
```cmd
# In PowerShell or CMD
vscode\install-extensions.bat
```

**Linux/macOS:**
```bash
# In terminal
chmod +x vscode/install-extensions.sh
./vscode/install-extensions.sh
```

#### Option 2: Manual via VS Code
VS Code will ask if you want to install recommended extensions. Click "Install All".

#### Option 3: VS Code Terminal
```bash
# In VS Code Terminal
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.csdevkit
code --install-extension eamodio.gitlens
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.vscode-json
```

## 🎯 Step 3: Configure GitHub Copilot Agents

### 2.1 Copy Agents to Project
```bash
# In your .NET project
mkdir -p agents
cp -r /path/dev-tools-ia/agents/* ./agents/

# Commit to repository
git add agents/
git commit -m "feat: add GitHub Copilot agents for .NET development"
git push origin main
```

### 2.2 Configure Copilot to use Agents
```json
// Add to your project's .vscode/settings.json
{
  "github.copilot.enable": {
    "*": true,
    "csharp": true
  },
  "github.copilot.chat.provider": "copilot",
  "github.copilot.advanced": {
    "useCopilotAgents": true,
    "agentsPath": "./agents"
  }
}
```

## 💻 Step 4: C#/.NET Workflow with Agents + OpenHands

### 4.1 Basic Chat (`Ctrl+L`)
Select code and use specialized prompts with agents:

```
Use design-patterns skill to refactor this method following SOLID principles and LINQ
```

```
Use entity-framework-core skill to create a Repository pattern for this DbContext
```

```
Use testing-xunit skill to add comprehensive unit tests for this class
```

### 4.2 Using OpenHands with Gemini
For complex tasks, use OpenHands at `http://localhost:3000`:

**For debugging and analysis:**
```
Analyze this .NET code and identify potential performance and security issues
```

**For complex refactoring:**
```
Refactor this code applying SOLID design patterns and .NET best practices
```

**For API creation:**
```
Create a complete RESTful Web API with Entity Framework, validation, and Swagger
```

### 4.3 Inline Edit (`Ctrl+I`)
Write comments and let AI generate:

```csharp
// TODO: Use security-jwt skill to implement JWT authentication
// TODO: Apply aspnet-core-api skill for proper validation
// TODO: Use performance-optimization skill for async handling
```

### 4.4 Local Context (`@Codebase`)
Use `@Codebase` in chat to reference entire project:

```
@Codebase Use dotnet-best-practices skill to create a service layer following Dependency Injection principles
```

### 4.5 Specialized C# Prompts with Agents

#### For Entity Framework Core:
```
Use entity-framework-core skill to generate a Repository pattern implementation for this DbContext with async methods, proper error handling, and unit testing support.
```

#### For Web API:
```
Use aspnet-core-api skill to create RESTful API endpoints with proper HTTP verbs, status codes, validation, and Swagger documentation.
```

#### For Unit Tests:
```
Use testing-xunit skill to generate comprehensive xUnit tests for this class using Arrange-Act-Assert pattern, mocking dependencies with Moq.
```

#### For Blazor:
```
Use blazor-components skill to create reusable Blazor components with proper state management and accessibility features.
```

#### For Performance:
```
Use performance-optimization skill to optimize this code for better performance and memory usage.
```

## 🔍 Step 5: Useful Commands

### 5.1 VS Code + Copilot Shortcuts
- `Ctrl+L`: Open Copilot chat
- `Ctrl+I`: Edit selected code
- `Ctrl+Shift+\`: Focus Copilot input
- `Ctrl+Shift+/`: Copilot slash commands
- `Ctrl+Shift+P`: "Copilot: " for special commands

### 5.2 Custom C#/.NET Shortcuts
- `Ctrl+Shift+C`: Generate async code
- `Ctrl+Shift+T`: Run tests in context
- `Ctrl+Shift+R`: Refactor code
- `Ctrl+Shift+M`: Add missing usings
- `Ctrl+Shift+U`: Remove unused usings

## 🚨 Professional Tips

### Performance with Agents + OpenHands
1. **Smaller context = Faster**: Use specific skills
2. **Avoid files >1000 lines**: Split into smaller classes
3. **Use direct prompts**: Be specific about desired skill
4. **OpenHands for complex tasks**: Use for debugging and heavy refactoring
5. **Copilot for quick tasks**: Autocomplete and small edits

### MCP Servers Configuration
The project includes MCP configuration with:
- **Memory**: Persistent storage (1GB)
- **Sequential Thinking**: Structured reasoning
- **Fetch**: Web access
- **Filesystem**: File operations
- **Git**: Version control
- **SQLite**: Local database
- **Puppeteer**: Web automation
- **Shadcn UI**: UI components
- **DeepWiki**: GitHub documentation

### Troubleshooting

**OpenHands not starting:**
```bash
# Check if Docker is running
docker ps

# Check if custom image exists
docker images | grep ai-studio-workspace

# If not exists, build image
docker-compose --profile build build

# Check logs
docker-compose logs openhands
```

**Gemini API key not working:**
1. Check if API key is correct
2. Confirm if Gemini API is enabled
3. Check environment variable

**Files not found:**
```bash
# Windows - Check paths
echo %APPDATA%
dir "%APPDATA%\Code\User"

# Linux/macOS - Check paths  
echo ~/.config/Code/User
ls -la ~/.config/Code/User
```

**Copilot not recognizing configuration:**
1. Check if path is correct:
   - Windows: `%APPDATA%\Code\User\settings.json`
   - Linux/macOS: `~/.config/Code/User/settings.json`
2. Restart VS Code completely
3. Check if Copilot extension is installed

**Shortcuts not working:**
1. Open `Ctrl+Shift+P` > "Preferences: Open Keyboard Shortcuts (JSON)"
2. Check if `keybindings.json` was copied correctly
3. Restart VS Code

**Agents not working:**
1. Check if `agents/` folder exists in project
2. Confirm `agentsPath` in settings.json
3. Restart VS Code to load agents

## 🎉 Complete Example: Generate xUnit Tests with Agents + OpenHands

### Using GitHub Copilot:
1. Select a C# class
2. `Ctrl+L` to open chat
3. Prompt with agent:
```
@Codebase Use testing-xunit skill to generate comprehensive xUnit tests for this repository class following these requirements:
- Use Arrange-Act-Assert pattern
- Mock dependencies with Moq
- Test all public methods
- Include edge cases and error scenarios
- Use meaningful test names
- Add Theory tests for parameter validation
```

### Using OpenHands for complex analysis:
1. Open `http://localhost:3000`
2. Paste complete code
3. Prompt:
```
Analyze this .NET class and generate:
1. Complete unit tests with xUnit and Moq
2. Code coverage analysis
3. Refactoring suggestions to improve testability
4. Identification of code smells and anti-patterns
```

## ✅ Final Verification

After following all steps, verify:

### ✅ VS Code Configured
- [ ] GitHub Copilot extension installed
- [ ] Settings copied to correct folder
- [ ] Custom shortcuts working
- [ ] Recommended extensions installed

### ✅ GitHub Copilot Working
- [ ] Login to GitHub Copilot completed
- [ ] Copilot responding to "Hello"
- [ ] Autocomplete working
- [ ] Slash commands available

### ✅ OpenHands with Gemini Configured
- [ ] Gemini API key configured
- [ ] Custom image `ai-studio-workspace` built with .NET SDK 10
- [ ] OpenHands running on localhost:3000
- [ ] Gemini 3.1 Flash Lite Preview responding
- [ ] Performance settings applied
- [ ] Custom sandbox with .NET SDK 10 working

### ✅ Agents Configured
- [ ] `agents/` folder copied to project
- [ ] Skills available in chat
- [ ] `@Codebase` context working with agents
- [ ] Specialized prompts responding

### ✅ MCP Servers Working
- [ ] MCP servers configured
- [ ] Memory server active
- [ ] Fetch and filesystem working
- [ ] Integration with OpenHands operational

Now you have a complete environment with GitHub Copilot for quick development and OpenHands with Gemini for complex tasks! 🚀
