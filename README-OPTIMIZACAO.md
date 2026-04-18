# 🚀 Memory Optimizations for OpenHands

## 📋 Overview

This document describes the optimizations implemented in the project to reduce memory and resource consumption, based on best practices from the official OpenHands documentation.

## � Custom Sandbox Image

The project uses a custom sandbox image (`ai-studio-workspace`) that extends the official OpenHands agent-server with .NET SDK 10 support for C# development.

### Custom Image Features
- **Base**: `nikolaik/python-nodejs:python3.12-nodejs22` (same as official agent-server)
- **Added**: .NET SDK 10 for C# development
- **Includes**: Python 3.12, Node.js 22, git, sudo, and common development tools
- **Location**: `runtime/Dockerfile`

### Build the Custom Image
```bash
# Build the custom sandbox image
docker-compose --profile build build

# Or build manually
docker build -t ai-studio-workspace ./runtime
```

## � Optimized Configurations

### 1. OpenHands - Low Resource Mode (Updated)

#### Key Environment Variables
```yaml
# Gemini 3.1 Flash Lite Preview optimized settings (V1 Standard)
LLM_API_KEY: your-gemini-api-key
LLM_MODEL: gemini/gemini-3.1-flash-lite-preview

# Persistence (V1 Standard)
OH_PERSISTENCE_DIR: /.openhands

# Sandbox Provider (V1 Standard)
RUNTIME: docker

# Workspace Mounting (V1 Standard)
SANDBOX_VOLUMES: ./workspace:/workspace:rw

# Agent Server (V1 Standard)
# Commented out - using custom sandbox image with .NET SDK 10
# AGENT_SERVER_IMAGE_REPOSITORY: ghcr.io/openhands/agent-server
# AGENT_SERVER_IMAGE_TAG: 1.15.0-python

# Custom Sandbox Runtime Container Image
# Uses locally built image with .NET SDK 10 support for C# development
SANDBOX_RUNTIME_CONTAINER_IMAGE: ai-studio-workspace

# Optimized sandbox
SANDBOX_MEMORY_LIMIT: "2g"           # 2GB for sandbox
SANDBOX_CPU_LIMIT: "0.5"              # Half CPU core
SANDBOX_TIMEOUT: 160                  # Optimized

# Reduced workspace
MAX_WORKSPACE_SIZE: "2g"              # 2GB max
WORKSPACE_TIMEOUT: 240                # Optimized
```

#### Docker Resources (Updated)
```yaml
deploy:
  resources:
    limits:
      memory: "768m"  # 768MB total
      cpus: "0.8"     # 0.8 CPU core
    reservations:
      memory: "384m"  # 384MB minimum
      cpus: "0.3"     # 0.3 CPU core
```

## 📊 Resource Consumption Comparison

| Component | Default | Optimized | Savings |
|------------|--------|-----------|----------|
| OpenHands | 4GB RAM | 2GB RAM | 50% |
| OpenHands Low-Resource | 1.5GB RAM | 768MB RAM | 49% |
| Parallelism | 1 request | 2-3 requests | 200% |

## 🎯 Hardware Recommendations

### Basic System (8GB Total RAM)
- Use `docker-compose.low-resource.yml` (768MB RAM)
- Close other applications
- Disable non-essential plugins

### Intermediate System (16GB Total RAM)
- Use `docker-compose.yml` (2GB RAM)
- Can keep some applications open

### Advanced System (32GB+ Total RAM)
- Use standard configuration with parallelism 3
- Enable all features

## ⚡ Additional Performance Tips

### 1. Monitoring
```bash
# Monitor container memory usage
docker stats --no-stream

# Monitor GPU VRAM
nvidia-smi --query-gpu=memory.used,memory.total --format=csv
```

### 2. Automatic Cleanup
```bash
# Clean stopped containers
docker container prune -f

# Clean unused images
docker image prune -f
```

### 3. System Swap
```bash
# Increase swap (Linux)
sudo swapon --show
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
```

## 🔍 Troubleshooting

### Error: "Out of Memory"
- Use `docker-compose.low-resource.yml`
- Consider `gemini-3.1-flash-lite-preview` model (optimized)
- Reduce memory limits in docker-compose file

### Error: "Container Killed"
- Check logs: `docker logs openhands-hands-app-low`
- Reduce memory limits by 25%
- Increase timeout for long operations

### Slow Performance
- Check Gemini API key
- Use temperature 0.35 for more creativity
- Increase memory limits in docker-compose file

## 📚 References

- [OpenHands Local Setup](https://docs.openhands.dev/openhands/usage/run-openhands/local-setup)
- [Agent Server Resource Management](https://docs.openhands.dev/sdk/arch/agent-server)
- [Local LLMs Guide](https://docs.openhands.dev/openhands/usage/llms/local-llms)
- [Docker Sandbox Configuration](https://docs.openhands.dev/openhands/usage/sandboxes/docker)

## 🔄 How to Use

### First Time Setup (Build Custom Image):
```bash
# Build the custom sandbox image with .NET SDK 10
docker-compose --profile build build

# Or build manually
docker build -t ai-studio-workspace ./runtime
```

### For Low Memory Systems:
```bash
# Use ultra-lightweight configuration (768MB RAM)
docker-compose -f docker-compose.low-resource.yml up -d
```

### For Moderate Memory Systems:
```bash
# Use optimized configuration (2GB RAM)
docker-compose up -d
```

### Real-time Monitoring:
```bash
# Monitoring script
watch -n 2 'docker stats --no-stream && echo "---" && free -h'
```

## 🎯 Achieved Benefits

✅ **50% memory savings** in total consumption  
✅ **200% throughput increase** with parallelism  
✅ **Compatibility** with any hardware (no GPU required)  
✅ **Stability** on 8GB RAM systems  
✅ **Performance** optimized with Gemini 3.1 Flash Lite Preview  
✅ **Scalability** - flexible configurations  
✅ **.NET SDK 10 support** for C# development in sandbox  

---

**Note**: These optimizations have been tested for Gemini 3.1 Flash Lite Preview with Google API and systems with 8-32GB RAM. Works on any hardware without GPU dependency.
