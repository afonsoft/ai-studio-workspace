# 📁 Workspace - Shared Work Area

## 📋 Overview

This directory serves as a shared work area between Docker containers, allowing file exchange and collaboration between different services of the DevTools IA project.

## 📁 Directory Structure

```
workspace/
├── README.md                    # This file
├── projects/                    # Development projects
│   ├── sample-csharp/          # Sample C# project
│   │   ├── src/                # Source code
│   │   ├── tests/              # Unit tests
│   │   └── README.md           # Project documentation
│   ├── documentation/          # Technical documentation
│   └── templates/             # Project templates
├── shared/                     # Shared files
│   ├── configs/               # Shared configurations
│   ├── scripts/               # Utility scripts
│   └── resources/             # Reusable resources
├── temp/                       # Temporary files
│   ├── uploads/               # Temporary uploads
│   ├── downloads/             # Temporary downloads
│   └── cache/                 # Shared cache
└── logs/                       # Shared logs
    ├── openhands/             # OpenHands logs
    └── webui/                 # WebUI logs
```

## 🎯 Purpose

### What is stored here:

1. **Development Projects**: Source code and project files
2. **Shared Files**: Common configurations and resources
3. **Temporary Data**: Uploads, downloads, and cache
4. **Consolidated Logs**: Logs from different services in one location
5. **Templates**: Reusable models for new projects

### Why this directory is important:

- **Collaboration**: Allows different services to access the same files
- **Persistence**: Data survives container restarts
- **Flexibility**: Work area for experimentation and development
- **Organization**: Centralizes files that would be scattered across multiple places

## 🔧 Configuration in Docker Compose

In the `docker-compose.yml` file, this directory is mounted as a volume in multiple services:

```yaml
services:
  openhands:
    volumes:
      - ./workspace:/workspace
  
  open-webui:
    volumes:
      - ./workspace:/workspace
```

This ensures that:
- OpenHands can access and modify project files
- WebUI can display and manage shared files
- All services see the same file structure

## 🚀 Use Cases

### 1. C#/.NET Development

```bash
# Create new project
mkdir workspace/projects/my-project
cd workspace/projects/my-project

# Initialize .NET project
dotnet new webapi -n MyProject
dotnet new sln -n MyProject
dotnet sln add src/MyProject

# Use OpenHands to develop
# Access http://localhost:3000 and use the workspace
```

### 2. Code Analysis with OpenHands

```bash
# Place code for analysis
cp /path/to/your/code.cs workspace/projects/analysis/

# Use OpenHands for analysis
# Access http://localhost:3000 and ask to analyze the code in /workspace/projects/analysis/
```

### 3. Documentation

```bash
# Create documentation
mkdir workspace/projects/documentation
echo "# My Project" > workspace/projects/documentation/README.md

# Use WebUI to edit documentation
# Access http://localhost:8080 and use the file editor
```

## 📊 File Management

### Recommended Structure for Projects:

```
workspace/projects/project-name/
├── src/                    # Source code
│   ├── Controllers/        # Controllers (API)
│   ├── Models/            # Models and DTOs
│   ├── Services/          # Business logic
│   ├── Data/              # Data access
│   └── Configuration/     # Configurations
├── tests/                  # Tests
│   ├── Unit/              # Unit tests
│   ├── Integration/       # Integration tests
│   └── E2E/               # E2E tests
├── docs/                   # Documentation
├── scripts/                # Build/deploy scripts
├── docker/                 # Docker files
└── README.md              # Project documentation
```

### Organization Scripts:

```bash
#!/bin/bash
# organize-workspace.sh

echo "🗂️ Organizing workspace..."

# Create basic structure
mkdir -p workspace/{projects,shared,temp,logs}
mkdir -p workspace/projects/{sample-csharp,documentation,templates}
mkdir -p workspace/shared/{configs,scripts,resources}
mkdir -p workspace/temp/{uploads,downloads,cache}
mkdir -p workspace/logs/{openhands,webui}

# Create sample project
if [ ! -d "workspace/projects/sample-csharp" ]; then
    mkdir -p workspace/projects/sample-csharp/{src,tests,docs}
    echo "# Sample C# Project" > workspace/projects/sample-csharp/README.md
    echo "This is a sample project to demonstrate workspace usage." >> workspace/projects/sample-csharp/README.md
fi

# Create shared scripts
cat > workspace/shared/scripts/clean-workspace.sh << 'EOF'
#!/bin/bash
echo "🧹 Cleaning workspace..."

# Remove old temporary files
find workspace/temp -name "*" -mtime +7 -delete

# Clean old logs
find workspace/logs -name "*.log" -mtime +30 -delete

echo "✅ Workspace cleaned"
EOF

chmod +x workspace/shared/scripts/clean-workspace.sh

echo "✅ Workspace organized"
```

## 🔍 Monitoring and Maintenance

### Monitoring Script:

```bash
#!/bin/bash
# monitor-workspace.sh

echo "📊 Workspace Monitoring"

# Check space usage
echo "💾 Space usage:"
du -sh workspace/*
echo ""

# Check large files
echo "📦 Large files (>100MB):"
find workspace -type f -size +100M -exec ls -lh {} \; 2>/dev/null
echo ""

# Check structure
echo "📁 Project structure:"
find workspace/projects -maxdepth 2 -type d | sort
echo ""

# Check permissions
echo "🔐 Checking permissions:"
find workspace -type f -not -perm -u=w -exec ls -la {} \; 2>/dev/null
echo ""

# Cleanup suggestion
echo "🧹 Cleanup suggestion:"
echo "  - Files in temp/ older than 7 days: $(find workspace/temp -mtime +7 | wc -l)"
echo "  - Logs older than 30 days: $(find workspace/logs -mtime +30 | wc -l)"
echo "  - Total space used: $(du -sh workspace | cut -f1)"
```

### Automatic Backup:

```bash
#!/bin/bash
# backup-workspace.sh

BACKUP_DIR="backups/workspace"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/workspace-backup-$TIMESTAMP.tar.gz"

echo "🗄️ Creating workspace backup"

# Create backup directory
mkdir -p $BACKUP_DIR

# Exclude temporary files from backup
tar --exclude='workspace/temp/*' \
    --exclude='workspace/logs/*' \
    --exclude='workspace/projects/*/bin/*' \
    --exclude='workspace/projects/*/obj/*' \
    -czf $BACKUP_FILE workspace/

echo "✅ Backup created: $BACKUP_FILE"

# Clean old backups (keep last 5)
ls -t $BACKUP_DIR/workspace-backup-*.tar.gz | tail -n +6 | xargs rm -f
```

## 🛠️ Service Integration

### OpenHands:

OpenHands uses the workspace as the default work directory:

```python
# Configuration in OpenHands
WORKSPACE_BASE = "/workspace"
WORKSPACE_MOUNT_PATH = "/workspace"
```

This allows OpenHands to:
- Create and modify project files
- Execute commands in the project context
- Have access to all source code
- Maintain state between sessions

### WebUI:

WebUI can:
- Display and edit workspace files
- Upload new files
- Organize projects
- Visualize directory structure

## 📚 Templates and Resources

### C# Project Template:

```bash
# Create template
mkdir -p workspace/templates/csharp-webapi

cat > workspace/templates/csharp-webapi/.template.config/template.json << 'EOF'
{
  "$schema": "http://json.schemastore.org/template",
  "author": "DevTools IA",
  "classifications": ["Web", "API", "C#"],
  "identity": "DevTools.IA.CSharp.WebAPI",
  "name": "DevTools IA C# Web API",
  "shortName": "dt-webapi",
  "tags": {
    "language": "C#",
    "type": "project"
  },
  "sourceName": "ProjectName",
  "preferNameDirectory": "true"
}
EOF
```

### Shared Scripts:

```bash
# Build script
cat > workspace/shared/scripts/build.sh << 'EOF'
#!/bin/bash
echo "🔨 Building project..."

cd /workspace/projects/$1

if [ -f "*.sln" ]; then
    dotnet build
else
    echo "❌ No .sln file found"
    exit 1
fi

echo "✅ Build completed"
EOF

chmod +x workspace/shared/scripts/build.sh
```

## 🔐 Security and Permissions

### Recommended Permissions:

```bash
# Owner: user running Docker
# Group: docker
# Permissions: 755 for directories, 644 for files

sudo chown -R $USER:docker workspace/
find workspace -type d -exec chmod 755 {} \;
find workspace -type f -exec chmod 644 {} \;
chmod +x workspace/shared/scripts/*.sh
```

### Security Considerations:

1. **Isolation**: Each service has limited access to what's needed
2. **Backup**: Implement regular backup of important projects
3. **Cleanup**: Remove sensitive data from temp/ regularly
4. **Monitoring**: Monitor unauthorized access

## 📈 Performance

### Optimizations:

1. **Flat Structure**: Avoid very deep directories
2. **Local Cache**: Use workspace/temp/cache for temporary files
3. **Regular Cleanup**: Remove unused files
4. **Compression**: Use compression for backups

### Metrics:

- **Maximum Size**: 10GB per project
- **Maximum Depth**: 5 directory levels
- **Files per Project**: Maximum 10,000 files
- **File Size**: Maximum 100MB per file

## 🔄 Best Practices

### For Development:

1. **Use the recommended structure**: Follow the organization pattern
2. **Document your projects**: Keep README.md updated
3. **Versioning**: Use .gitignore for temporary files
4. **Testing**: Keep tests in the appropriate directory

### For Collaboration:

1. **Share only what's necessary**: Don't put sensitive files
2. **Use descriptive names**: Facilitate file identification
3. **Clean up after use**: Remove temporary files
4. **Document the process**: Keep usage guides updated

## 📝 Practical Examples

### Example 1: Create Web API Project

```bash
# Create structure
mkdir -p workspace/projects/my-api/{src,tests,docs}

# Initialize project
cd workspace/projects/my-api
dotnet new webapi -n MyAPI
dotnet new sln -n MyAPI
dotnet sln add src/MyAPI

# Use OpenHands to develop
# Access http://localhost:3000 and ask to develop endpoints
```

### Example 2: Code Analysis with OpenHands

```bash
# Copy code for analysis
cp -r /path/to/existing/code workspace/projects/analysis/

# Use OpenHands for analysis
# Access http://localhost:3000 and ask to analyze the code in /workspace/projects/analysis/ and suggest improvements

# Generate documentation with OpenHands
# Ask to create documentation for the code in /workspace/projects/analysis/
```

### Example 3: Reusable Template

```bash
# Create template
cp -r workspace/projects/sample-csharp workspace/templates/my-template

# Customize template
# Edit files in workspace/templates/my-template/

# Use template for new project
cp -r workspace/templates/my-template workspace/projects/new-project
cd workspace/projects/new-project
# Customize as needed
```

## 📚 Additional Documentation

- [OpenHands Guide](../README.md)
- [WebUI Interface](../openhands/README.md)
- [Docker Compose](../docker-compose.yml)
- [GitHub Copilot Agents](../agents/AGENTS.md)

---

**Important**: The workspace is a shared area. Be careful with sensitive files and implement regular backup and cleanup policies.
