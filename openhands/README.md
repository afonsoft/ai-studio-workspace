# 🤖 OpenHands - Autonomous AI Environment

## 📋 Overview

This directory contains OpenHands configurations and data, the autonomous AI environment that enables execution of complex tasks with access to tools and programming capabilities.

## 📁 Directory Structure

```
openhands/
├── README.md                    # This file
├── settings.json                # Main OpenHands settings
├── config.json                  # Additional settings
├── data/                        # Persistent data
│   ├── conversations/           # Conversation history
│   ├── workspaces/              # User workspaces
│   ├── tools/                   # Tool configurations
│   └── cache/                   # Response cache
├── logs/                        # System logs
│   ├── app.log                  # Application logs
│   ├── agent.log                # Agent logs
│   └── error.log                # Error logs
├── plugins/                     # Custom plugins
│   ├── custom-tools/            # Custom tools
│   └── extensions/              # System extensions
└── backups/                     # Automatic backups
    ├── settings-20240307.json
    └── conversations-20240307.tar.gz
```

## 🎯 Purpose

### What is stored here:

1. **Settings**: LLM parameters, timeouts, limits
2. **Conversations**: Complete interaction history
3. **Workspaces**: Work environments per user/session
4. **Tools**: Available tool configurations
5. **Logs**: Detailed operation records

### Why this directory is important:

- **Persistence**: Maintains state between restarts
- **Customization**: Allows user-specific settings
- **Debug**: Facilitates troubleshooting with detailed logs
- **Backup**: Protects important system data

## 🔧 OpenHands V1 Configuration

### Environment Variables (Official V1 Standard)

```bash
# LLM Configuration
LLM_API_KEY="your-gemini-api-key"
LLM_MODEL="gemini/gemini-3.1-flash-lite-preview"

# Persistence
OH_PERSISTENCE_DIR="/.openhands"

# Sandbox Provider
RUNTIME="docker"

# Workspace Mounting
SANDBOX_VOLUMES="$PWD:/workspace:rw"

# Agent Server
# Commented out - using custom sandbox image with .NET SDK 10
# AGENT_SERVER_IMAGE_REPOSITORY="ghcr.io/openhands/agent-server"
# AGENT_SERVER_IMAGE_TAG="1.15.0-python"

# Custom Sandbox Runtime Container Image
# Uses locally built image with .NET SDK 10 for C# development
SANDBOX_RUNTIME_CONTAINER_IMAGE="ai-studio-workspace"
```

### Custom Sandbox Image

The project uses a custom sandbox image (`ai-studio-workspace`) that extends the official OpenHands agent-server with .NET SDK 10 support for C# development.

**Custom Image Features:**
- **Base**: `nikolaik/python-nodejs:python3.12-nodejs22` (same as official agent-server)
- **Added**: .NET SDK 10 for C# development
- **Python Packages**: numpy, pandas for data processing
- **Tools**: ffmpeg for media processing, git, sudo, wget, vim, nano
- **Location**: `runtime/Dockerfile`

**Build the Image:**
```bash
# Using docker-compose
docker-compose --profile build build

# Or manually
docker build -t ai-studio-workspace ./runtime
```

### settings.json (Legacy Format)

```json
{
  "llm_model": "gemini/gemini-3.1-flash-lite-preview",
  "llm_api_key": "YOUR_API_KEY_HERE",
  "llm_base_url": "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-flash-lite-preview:generateContent"
}
```

### settings.json

```json
{
  "llm": {
    "provider": "gemini",
    "base_url": "https://generativelanguage.googleapis.com",
    "model": "gemini-3.1-flash-lite-preview",
    "temperature": 0.1,
    "max_tokens": 4096,
    "context_window": 4096,
    "timeout": 600
  },
  "agent": {
    "max_iterations": 30,
    "max_parallel_requests": 1,
    "enable_auto_lint": true,
    "memory_budget": 4294967296
  },
  "sandbox": {
    "timeout": 300,
    "memory_limit": "2g",
    "cpu_limit": "1.0",
    "workspace_base": "/workspace",
    "workspace_mount_path": "/workspace"
  },
  "editor": {
    "default_path": "/workspace",
    "auto_save": true,
    "syntax_highlighting": true
  },
  "ui": {
    "theme": "dark",
    "language": "pt-BR",
    "show_line_numbers": true,
    "word_wrap": true
  }
}
```

### config.json (Additional Settings)

```json
{
  "system": {
    "log_level": "INFO",
    "enable_metrics": true,
    "enable_tracing": false,
    "max_conversation_history": 100
  },
  "tools": {
    "enabled": [
      "bash",
      "python",
      "file_operations",
      "git_operations",
      "docker_operations",
      "web_search"
    ],
    "disabled": [],
    "custom": {
      "csharp_analyzer": {
        "path": "/usr/local/bin/csharp-analyzer",
        "enabled": true
      }
    }
  },
  "security": {
    "allow_network_access": true,
    "allow_file_system_access": true,
    "restricted_paths": [
      "/etc",
      "/root",
      "/sys"
    ],
    "max_file_size": "100MB"
  },
  "performance": {
    "cache_responses": true,
    "cache_ttl": 3600,
    "enable_streaming": true,
    "batch_size": 8
  }
}
```

## 🤖 Main Features

### 1. Autonomous Agent

OpenHands works as an autonomous agent capable of:

- **Execute code** in multiple languages
- **Manipulate files** and file system
- **Use external tools** via API
- **Access internet** for research
- **Learn** from conversation context

### 2. Secure Sandbox

The sandbox environment ensures:

- **Isolation**: Operations confined to workspace
- **Security**: Controlled system access
- **Resources**: CPU and memory limits
- **Persistence**: State maintained between sessions

### 3. Web Interface

Accessible via http://localhost:3000 with:

- **Chat Interface**: Natural interaction with agent
- **Code Editor**: Code editor with syntax highlighting
- **File Explorer**: File navigation and management
- **Terminal**: Direct access to sandbox
- **Settings**: Customizable settings

## 🚀 Use Cases

### 1. C#/.NET Development

```bash
# Access http://localhost:3000
# Use prompts like:

"Create a new Web API project with Entity Framework Core"
"Implement a repository pattern for this DbContext"
"Generate xUnit tests for this service class"
"Refactor this method using SOLID principles"
"Add authentication to this API endpoint"
```

### 2. Code Analysis

```bash
# Analyze existing project
"Analyze this C# project and suggest improvements"
"Check for security vulnerabilities in this code"
"Generate documentation for this API"
"Create architecture diagrams for this system"
```

### 3. Automation

```bash
# Create scripts and automations
"Create a PowerShell script to deploy this application"
"Generate a Dockerfile for this .NET project"
"Create CI/CD pipeline configuration for GitHub Actions"
"Set up automated testing for this project"
```

## 📊 Monitoring and Logs

### Log Structure

```
logs/
├── app.log              # General application logs
├── agent.log            # Specific agent logs
├── error.log            # Error and exception logs
├── access.log           # API access logs
├── performance.log      # Performance logs
└── security.log         # Security event logs
```

### Monitoring Scripts

```bash
#!/bin/bash
# monitor-openhands.sh

echo "🤖 OpenHands Monitoring"

# Check if running
if docker ps | grep -q openhands-hands-app; then
    echo "✅ Container running"
else
    echo "❌ Container stopped"
    exit 1
fi

# Check resource usage
echo "📈 Resources:"
docker stats --no-stream openhands-hands-app

# Check recent logs
echo "📋 Recent logs:"
docker logs --tail=10 openhands-hands-app

# Check errors
echo "🚨 Recent errors:"
docker logs openhands-hands-app 2>&1 | grep -i error | tail -5

# Check active conversations
echo "💬 Active conversations:"
docker exec openhands-hands-app ls /openhands/data/conversations/ 2>/dev/null | wc -l
```

## 🔧 Administration and Maintenance

### Automatic Backup

```bash
#!/bin/bash
# backup-openhands.sh

BACKUP_DIR="backups/openhands"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "🗄️ OpenHands Backup"

# Create backup directory
mkdir -p $BACKUP_DIR

# Backup settings
cp openhands/settings.json $BACKUP_DIR/settings-$TIMESTAMP.json
cp openhands/config.json $BACKUP_DIR/config-$TIMESTAMP.json

# Backup conversations
if [ -d "openhands/data/conversations" ]; then
    tar -czf $BACKUP_DIR/conversations-$TIMESTAMP.tar.gz openhands/data/conversations/
fi

# Backup workspaces
if [ -d "openhands/data/workspaces" ]; then
    tar -czf $BACKUP_DIR/workspaces-$TIMESTAMP.tar.gz openhands/data/workspaces/
fi

# Clean old backups (keep last 7)
ls -t $BACKUP_DIR/settings-*.json | tail -n +8 | xargs rm -f
ls -t $BACKUP_DIR/conversations-*.tar.gz | tail -n +8 | xargs rm -f
ls -t $BACKUP_DIR/workspaces-*.tar.gz | tail -n +8 | xargs rm -f

echo "✅ Backup completed"
```

### Cleanup and Maintenance

```bash
#!/bin/bash
# cleanup-openhands.sh

echo "🧹 OpenHands Cleanup"

# Clean old logs
find openhands/logs -name "*.log" -mtime +7 -delete

# Clean old cache
find openhands/data/cache -name "*" -mtime +1 -delete

# Clean very old conversations (30 days)
find openhands/data/conversations -name "*" -mtime +30 -delete

# Clean inactive workspaces (7 days)
find openhands/data/workspaces -name "*" -mtime +7 -delete

# Compress large logs
find openhands/logs -name "*.log" -size +10M -exec gzip {} \;

echo "✅ Cleanup completed"
```

## 🔧 Advanced Configuration

### Model Customization

```json
{
  "llm": {
    "provider": "gemini",
    "models": {
      "coding": {
        "model": "gemini-3.1-flash-lite-preview",
        "temperature": 0.1,
        "max_tokens": 4096
      },
      "analysis": {
        "model": "gemini-3.1-flash-lite-preview",
        "temperature": 0.2,
        "max_tokens": 8192
      },
      "creative": {
        "model": "gemini-3.1-flash-lite-preview",
        "temperature": 0.7,
        "max_tokens": 2048
      }
    }
  }
}
```

### Custom Plugins

```javascript
// openhands/plugins/custom-tools/csharp-analyzer.js
class CSharpAnalyzer {
    constructor() {
        this.name = 'csharp-analyzer';
        this.description = 'Analyze C# code for best practices';
    }

    async execute(code) {
        // Lógica de análise
        return {
            issues: [],
            suggestions: [],
            metrics: {}
        };
    }
}

module.exports = CSharpAnalyzer;
```

## 🔐 Security

### Security Settings

```json
{
  "security": {
    "allow_network_access": true,
    "allowed_domains": [
      "api.github.com",
      "docs.microsoft.com",
      "stackoverflow.com"
    ],
    "blocked_domains": [
      "malicious-site.com"
    ],
    "max_file_size": "100MB",
    "allowed_file_types": [
      ".cs", ".json", ".xml", ".md", ".txt", ".yml", ".yaml"
    ],
    "scan_uploads": true,
    "rate_limiting": {
      "requests_per_minute": 60,
      "burst_size": 10
    }
  }
}
```

### Security Best Practices

1. **Network Isolation**: Limit access to specific domains
2. **Upload Validation**: Scan uploaded files
3. **Rate Limiting**: Limit requests per user
4. **Audit Logging**: Log all important actions
5. **Regular Updates**: Keep image updated

## 📈 Performance and Optimization

### Important Metrics

- **Response Time**: < 2 seconds for simple prompts
- **Throughput**: > 10 requests per minute
- **Memory Usage**: < 4GB for normal operations
- **Error Rate**: < 1% for standard operations

### Optimizations

```json
{
  "performance": {
    "cache_responses": true,
    "cache_ttl": 3600,
    "enable_streaming": true,
    "batch_size": 8,
    "parallel_processing": false,
    "preload_models": true,
    "optimize_for": "speed"
  }
}
```

## 🛠️ Troubleshooting

### Common Problems

1. **Container not starting**
   ```bash
   # Check logs
   docker logs openhands-hands-app
   
   # Check settings
   cat openhands/settings.json
   
   # Restart container
   docker restart openhands-hands-app
   ```

2. **Gemini API connection fails**
   ```bash
   # Test connection
  docker exec openhands-hands-app curl -H "Content-Type: application/json" -d '{"contents":[{"parts":[{"text":"Hello"}]}]}' "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-flash-lite-preview:generateContent?key=YOUR_API_KEY"
   
   # Check API Key configuration
   cat openhands/settings.json | grep api_key
   ```

3. **Slow performance**
   ```bash
   # Check resources
   docker stats openhands-hands-app
   
   # Adjust settings
   # Reduce max_tokens or context_window
   # Disable non-essential features
   ```

4. **Permission errors**
   ```bash
   # Check workspace permissions
   ls -la workspace/
   
   # Fix permissions
   sudo chown -R $USER:$USER workspace/
   chmod -R 755 workspace/
   ```

## 📚 Integration with Other Services

### Gemini API

- **Endpoint**: `https://generativelanguage.googleapis.com`
- **Models**: `gemini-3.1-flash-lite-preview` main
- **API**: Communication via REST API
- **Authentication**: API Key configured in settings.json

### Workspace

- **Mount**: `/workspace` mounted from host
- **Persistence**: Files maintained between sessions
- **Access**: Complete file system access

### GitHub Copilot

- **Integration**: Agents available in workspace
- **Configuration**: Skills and rules for .NET development
- **Usage**: Copilot for quick development, OpenHands for complex tasks

## 🔄 Roadmap

### v1.5.0 (Planned)
- Simultaneous multi-model
- Performance improvements
- More integrated tools
- Improved interface

### v2.0.0 (Planned)
- Multi-user support
- Advanced plugin system
- Integration with more services
- Analytics dashboard

## 📝 Release Notes

### v1.4.0 (Current)
- Configuration optimized for Gemini API
- GitHub Copilot Agents support
- Memory and performance improvements
- Portuguese interface

### v1.3.0
- Gemini API integration
- Improved sandbox
- More available tools

---

**Important**: OpenHands is a powerful tool. Use responsibly and implement appropriate security settings for your environment.
