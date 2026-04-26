# AGENTS.md - Single Source of Truth

## Mission
Modern .NET/C# and Angular development environment optimized for AI agents with GitHub Copilot, OpenHands, and MCP integration.

## Technology Stack
- **Backend**: .NET 8+, .NET 10, C# 12+, Entity Framework Core
- **Frontend**: Angular v20+, TypeScript, Tailwind CSS
- **AI/ML**: Gemini API (gemini-3.1-flash-lite-preview), GitHub Copilot, OpenHands
- **Infrastructure**: Docker, Docker Compose, Model Context Protocol (MCP)
- **Testing**: xUnit, Vitest/Jasmine, Playwright

## Code Patterns (SOLID + Clean Architecture)
- **S**: Single Responsibility - Each class has one reason to change
- **O**: Open/Closed - Open for extension, closed for modification
- **L**: Liskov Substitution - Subtypes must be substitutable
- **I**: Interface Segregation - Clients shouldn't depend on unused interfaces
- **D**: Dependency Inversion - Depend on abstractions, not concretions

## Project Structure
```
src/              # Source code
├── Domain/       # Business logic, entities, interfaces
├── Application/  # Use cases, DTOs, application services
├── Infrastructure/ # EF Core, external services, repositories
└── Presentation/  # Controllers, APIs, UI components
tests/            # Unit and integration tests
agents/           # AI skills, rules, and memory
```

## Coding Conventions
- **C#**: PascalCase for classes/methods, camelCase for locals, _camelCase for private fields
- **Async**: Always use async/await, avoid .Result or .Wait()
- **Angular**: Standalone components with signals, OnPush change detection
- **API**: RESTful with proper HTTP verbs, DTOs for data transfer
- **EF Core**: NoTracking by default, split queries for navigation collections

## Build Commands
```bash
dotnet build              # Build solution
dotnet test               # Run tests
dotnet run --project src/MyProject  # Run application
docker-compose up -d      # Start Docker services
```

## Agent Engagement Rules
- **DO**: Follow SOLID principles and Clean Architecture
- **DO**: Use async/await for I/O operations
- **DO**: Write unit tests for business logic
- **DO**: Use proper error handling and logging
- **DO**: Follow RESTful API design principles

## Agent Restrictions
- **NEVER**: Modify generated files (bin/, obj/, node_modules/)
- **NEVER**: Change .gitignore or CI/CD without explicit request
- **NEVER**: Modify secrets.json or .env files
- **NEVER**: Remove existing tests without replacement
- **NEVER**: Break backward compatibility without migration path

## Documentation References
- [agents/README.md](agents/README.md) - Agent infrastructure
- [agents/MEMORY.md](agents/MEMORY.md) - Technical decisions log
- [agents/skills/](agents/skills/) - Modular skill packages
- [DESIGN.md](DESIGN.md) - Architecture and design patterns
- [llms.txt](llms.txt) - Web/LLM discoverability
