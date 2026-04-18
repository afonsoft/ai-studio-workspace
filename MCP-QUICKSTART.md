# 🚀 MCP Quickstart Guide

Quick setup of MCP servers for C#/.NET development with OpenHands and optimized Gemini 3.1 Flash Lite Preview API.

## 🎯 Objective

Quickly configure essential MCP servers to maximize productivity with OpenHands and optimized Gemini 3.1 Flash Lite Preview API.

## ⚡ Quick Setup (5 minutes)

### 1. Server Installation

```bash
# Install main servers
npm install -g @modelcontextprotocol/server-memory
npm install -g @modelcontextprotocol/server-sequential-thinking
npm install -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-git
pip install mcp-server-fetch

# Optional servers (recommended)
npm install -g @modelcontextprotocol/server-sqlite
npm install -g @modelcontextprotocol/server-puppeteer
```

### 2. Automatic Configuration

```bash
# The start.sh script already configures MCP automatically
./start.sh

# Or configure manually
cp mcp-config.json openhands/
docker-compose restart openhands
```

### 3. Verification

```bash
# Check if MCP is working
docker-compose exec openhands curl -f http://localhost:3000/health

# Check MCP logs
docker-compose logs openhands | grep -i mcp
```

## 🔧 Essential Configuration

### openhands/settings.json (already configured for Gemini)
```json
{
  "mcp_config": {
    "sse_servers": [
      {
        "url": "https://mcp.deepwiki.com/mcp",
        "api_key": null
      }
    ],
    "stdio_servers": [
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-memory"],
        "env": {
          "MEMORY_LIMIT": "1GB",
          "CACHE_SIZE": "100MB"
        }
      },
      {
        "command": "npx", 
        "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-filesystem", "/workspace"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-git"],
        "env": {}
      },
      {
        "command": "python",
        "args": ["-m", "mcp_server_fetch"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-sqlite"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-puppeteer"],
        "env": {}
      },
      {
        "command": "npx",
        "args": ["-y", "@modelcontextprotocol/server-shadcn-ui"],
        "env": {}
      }
    ],
    "shttp_servers": []
  }
}
```

## 🎯 Immediate Use Cases

### 1. Automatic Repository Pattern
```
Prompt: "Create Repository pattern for Entity Framework Core with async methods using MCP filesystem and git servers"
```

### 2. Intelligent Code Review
```
Prompt: "Review this C# code using SOLID principles and suggest improvements with MCP sequential-thinking"
```

### 3. Database Operations
```
Prompt: "Create SQLite database schema for this C# project using MCP sqlite server"
```

### 4. Web Scraping
```
Prompt: "Extract data from this website using MCP puppeteer server"
```

## 📊 Configured Servers

| Server | Type | Main Use | Requirement |
|----------|------|----------|-------------|
| memory | stdio | Persistent memory | npm |
| sequential-thinking | stdio | Structured processing | npm |
| filesystem | stdio | Local files | npm |
| git | stdio | Version control | npm |
| fetch | stdio | HTTP requests | pip |
| deepwiki | sse | Technical documentation | free |
| sqlite | stdio | Database | npm |
| puppeteer | stdio | Web automation | npm |
| shadcn-ui | stdio | UI components | npm |

## 🚀 Quick Test

### Basic Test
```bash
# Access OpenHands
http://localhost:3000

# Test MCP memory
Prompt: "Remember that my project uses .NET 8 and Entity Framework Core"

# Test MCP filesystem  
Prompt: "List all .cs files in the project using filesystem"

# Test MCP git
Prompt: "Check git status and create a branch for feature X"
```

### Advanced Test
```bash
# Test complete workflow with Gemini 3.1 Flash Lite Preview
Prompt: "Using MCP servers and Gemini 3.1 Flash Lite Preview:
1. Analyze current project (filesystem)
2. Create unit tests for main classes with xUnit
3. Commit changes (git)
4. Document the process (memory)
5. Optimize performance with parallel processing"
```

## 🔥 Immediate Benefits

✅ **10x Productivity** with repetitive task automation  
✅ **Quality** with SOLID principles and best practices  
✅ **Speed** with optimized Git and filesystem operations  
✅ **Intelligence** with contextual memory and learning  
✅ **Automation** with web scraping and database operations  
✅ **Documentation** with access to technical knowledge via deepwiki  
✅ **Performance** with optimized Gemini 3.1 Flash Lite Preview  
✅ **UI Components** with shadcn-ui integration  

## 🚨 Quick Troubleshooting

### Server not found
```bash
# Reinstall specific server
npm install -g @modelcontextprotocol/server-name

# Check installation
npx @modelcontextprotocol/server-name --help
```

### Permission denied
```bash
# Check workspace permissions
docker-compose exec openhands ls -la /workspace

# Adjust permissions if needed
docker-compose exec openhands chmod -R 755 /workspace
```

### MCP not starting
```bash
# Check complete logs
docker-compose logs openhands

# Restart OpenHands
docker-compose restart openhands
```

## 📚 Next Steps

- **Complete Guide**: See [MCP-README.md](./MCP-README.md)
- **OpenHands Config**: See [openhands/README.md](./openhands/README.md)
- **Practical Examples**: See [README.md](./README.md#practical-examples)

---

**Ready to accelerate your C#/.NET development with MCP and Gemini 3.1 Flash Lite Preview?** 🚀

Complete setup in 5 minutes with optimized performance! ⚡
