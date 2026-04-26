# AGENTS.md - .NET Development with GitHub Copilot

## Project Overview
Modern .NET/C# and Angular development environment with GitHub Copilot agents, skills, and OpenHands integration. Optimized for Gemini API (gemini-3.1-flash-lite-preview).

## Build Commands
```bash
# Build solution
dotnet build

# Run tests
dotnet test

# Run application
dotnet run --project src/MyProject

# Docker
docker-compose up -d
```

## Coding Conventions
- **C#**: PascalCase for classes/methods, camelCase for locals, _camelCase for private fields
- **Async**: Always use async/await, avoid .Result or .Wait()
- **Angular**: Standalone components with signals, OnPush change detection
- **API**: RESTful with proper HTTP verbs, DTOs for data transfer
- **EF Core**: NoTracking by default, split queries for navigation collections

## Project Structure
```
src/              # Source code
├── Controllers/  # API endpoints
├── Models/       # Entities and DTOs
├── Services/     # Business logic
├── Data/         # EF Core DbContext
tests/            # Unit and integration tests
agents/           # Skills and rules
```

## What Agents Must Not Touch
- Never modify generated files (bin/, obj/, node_modules/)
- Never change .gitignore or CI/CD configurations without explicit request
- Never modify secrets.json or .env files
- Never remove existing tests without replacement
- Never break backward compatibility without migration path

## Skills & Rules
See `agents/AGENTS.md` for detailed skill packages and coding rules.

## MCP Integration
Model Context Protocol servers configured in `mcp-config.json` for filesystem, git, and database operations.

## References
- [agents/AGENTS.md](agents/AGENTS.md) - Complete skills and rules guide
- [agents/rules/](agents/rules/) - Coding standards and conventions
- [agents/skills/](agents/skills/) - Reusable skill packages
- [DESIGN.md](DESIGN.md) - Architecture and design patterns
