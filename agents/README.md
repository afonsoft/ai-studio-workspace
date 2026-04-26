# Agents Infrastructure

## Overview
This directory contains the complete AI agent infrastructure for the ai-studio-workspace project, following Agentic AI Foundation standards.

## Directory Structure

```
agents/
├── README.md           # This file - infrastructure documentation
├── MEMORY.md           # Technical decisions and learning log
├── .aiignore          # Files to exclude from AI agent access
├── skills/             # Modular skill packages
│   └── [skill-name]/
│       └── SKILL.md   # Skill definition and workflows
└── rules/              # Project-specific coding rules
    ├── csharp-coding-standards.md
    ├── dotnet-project-structure.md
    ├── api-design-guidelines.md
    ├── database-conventions.md
    └── git-workflow.md
```

## Components

### Skills System
- **Location**: `agents/skills/`
- **Format**: Each skill in its own directory with `SKILL.md`
- **Loading**: Auto-discovery by AI agents based on context
- **Modularity**: Single responsibility per skill

### Memory System
- **File**: `agents/MEMORY.md`
- **Purpose**: Persistent learning across sessions
- **Format**: Timestamped decision entries
- **Usage**: Avoids repetitive error loops

### Rules System
- **Location**: `agents/rules/`
- **Application**: Auto-applied based on file patterns
- **Scope**: Technology-specific conventions
- **Integration**: Works with all AI agents

### Exclusion System
- **File**: `agents/.aiignore`
- **Purpose**: Prevents AI from accessing sensitive files
- **Pattern**: Similar to .gitignore but for AI agents
- **Scope**: Build outputs, secrets, logs, cache

## Skill Loading Process

1. **Discovery**: Agents scan `agents/skills/` for SKILL.md files
2. **Context Matching**: Skills loaded based on current task context
3. **Execution**: Skill workflows applied as needed
4. **Learning**: Outcomes logged to MEMORY.md

## Agent Compatibility

### Supported Agents
- **Claude Code**: Uses CLAUDE.md with @import AGENTS.md
- **GitHub Copilot**: Reads AGENTS.md and project instructions
- **Cursor**: Uses .cursor/rules/ and AGENTS.md
- **OpenHands**: Follows AGENTS.md restrictions and MCP integration
- **Generic AI**: Uses AGENTS.md as primary context

### Integration Points
- **MCP Servers**: Model Context Protocol for tool access
- **File System**: Direct file operations through agents/
- **Memory**: Persistent learning via MEMORY.md
- **Rules**: Consistent behavior across all agents

## Configuration

### Environment Variables
- `LLM_API_KEY`: Gemini API key for AI operations
- `AGENTS_PATH`: Path to agents directory (default: ./agents)
- `MEMORY_ENABLED`: Enable persistent memory (default: true)

### MCP Configuration
See `mcp-config.json` for Model Context Protocol server setup.

## Best Practices

### For Skill Development
- Use kebab-case for skill directory names
- Include clear when-to-use guidance
- Provide step-by-step workflows
- Add troubleshooting section

### For Agent Usage
- Always check AGENTS.md first
- Reference MEMORY.md for previous decisions
- Follow DO/NEVER rules strictly
- Log learning outcomes

### For Maintenance
- Update MEMORY.md with new decisions
- Review skills quarterly for relevance
- Keep .aiignore current with project changes
- Validate SKILL.md format compliance

## Integration with Development Workflow

### Before Coding
1. Agent reads AGENTS.md for project context
2. Checks MEMORY.md for relevant past decisions
3. Loads appropriate skills from agents/skills/

### During Development
1. Applies rules from agents/rules/ automatically
2. Uses MCP servers for tool access
3. Logs decisions to MEMORY.md for future reference

### After Development
1. Updates MEMORY.md with lessons learned
2. Validates compliance with AGENTS.md standards
3. Suggests improvements to skills/rules

## Troubleshooting

### Common Issues
- **Skills not loading**: Check SKILL.md format
- **Rules not applying**: Verify file patterns in rules/
- **Memory not persisting**: Check MEMORY.md permissions
- **MCP connection issues**: Verify mcp-config.json

### Debug Information
- Agent logs include skill loading status
- MEMORY.md shows decision history
- .aiignore prevents access to excluded files
- AGENTS.md provides always-available context

## References
- [../AGENTS.md](../AGENTS.md) - Single Source of Truth
- [../DESIGN.md](../DESIGN.md) - Architecture and design patterns
- [../llms.txt](../llms.txt) - Web/LLM discoverability
- [awesome-ai-conventions](https://github.com/GuilhermeAlbert/awesome-ai-conventions) - Standards reference
