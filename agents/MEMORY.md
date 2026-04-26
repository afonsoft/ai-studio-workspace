# MEMORY.md - Technical Decisions Log

## Purpose
This file serves as persistent memory for AI agents working on this project, capturing technical decisions, lessons learned, and avoiding repetitive error loops.

## Structure
```
## [YYYY-MM-DD] - Decision Category
### Context
**Problem**: Brief description of the issue or challenge
**Solution**: Decision made and implementation approach
**Rationale**: Why this solution was chosen
**Outcome**: Result and any follow-up actions
```

## Technical Decisions

### [2026-04-26] - File-Based Context Architecture
**Context**: Restructuring documentation to follow Agentic AI Foundation standards
**Problem**: Documentation scattered across multiple large files, not following modern AI agent conventions
**Solution**: 
- Moved AGENTS.md to root as Single Source of Truth (<100 lines)
- Created modular file structure: MEMORY.md, .aiignore, llms.txt
- Implemented @import pattern in CLAUDE.md for consistency
- Separated concerns: AGENTS.md (rules), DESIGN.md (patterns), llms.txt (discovery)
**Rationale**: Following awesome-ai-conventions ensures interoperability across Claude, Cursor, Copilot, and other AI tools
**Outcome**: Successfully aligned with Agentic AI Foundation standards, improved agent discoverability

### [2026-04-26] - Agent Engagement Rules
**Context**: Defining clear boundaries for AI agent behavior
**Problem**: Agents need explicit guidance on what they can and cannot modify
**Solution**: Established DO/NEVER rules in AGENTS.md
**Rationale**: Prevents accidental modification of critical files and maintains project stability
**Outcome**: Clear agent boundaries defined, reducing risk of unintended changes

## Common Patterns to Avoid

### Error Loops
- **EF Core Tracking Issues**: Always use AsNoTracking() for read-only queries
- **Async/Anti-Patterns**: Never use .Result or .Wait() in async code
- **Generated File Modifications**: Never modify bin/, obj/, or node_modules/

### Performance Anti-Patterns
- **N+1 Queries**: Use Include() or split queries for navigation properties
- **Large Context Windows**: Keep AGENTS.md under 100 lines for efficient loading
- **Synchronous I/O**: Always use async/await for database and network operations

## Architecture Decisions

### Clean Architecture Implementation
- **Domain Layer**: No dependencies, pure business logic
- **Application Layer**: Depends on Domain, implements use cases
- **Infrastructure Layer**: Depends on Application, implements external concerns
- **Presentation Layer**: Depends on Application, handles UI/API

### Technology Stack Choices
- **.NET 8+**: Modern features, performance improvements
- **Angular v20+**: Standalone components, signals, improved performance
- **Gemini API**: gemini-3.1-flash-lite-preview for optimal cost/performance
- **MCP**: Model Context Protocol for tool interoperability

## Debugging Learnings

### Common Issues
1. **Docker Volume Permissions**: Ensure workspace/ has proper permissions
2. **MCP Server Configuration**: Verify mcp-config.json syntax
3. **Agent Context Loading**: Check @import paths in CLAUDE.md
4. **Skill Discovery**: Verify SKILL.md format in agents/skills/

### Solutions Applied
- Standardized Docker volume mounting
- Implemented MCP configuration validation
- Created modular skill loading system
- Established clear file naming conventions

## Future Considerations

### Scalability
- Consider microservices architecture for large projects
- Implement event-driven patterns for decoupling
- Add caching strategies for performance

### Maintainability
- Regular skill updates for framework changes
- Quarterly architecture reviews
- Continuous integration testing for agent workflows
