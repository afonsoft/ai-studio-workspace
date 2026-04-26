# CLAUDE.md - Claude-Specific Instructions

## Claude Configuration
This file extends AGENTS.md with Claude-specific optimizations for the ai-studio-workspace.

## Claude-Specific Features
- **Memory Integration**: Automatic learning persistence via MEMORY.md
- **Tool Usage**: Prefer MCP servers for filesystem and git operations
- **Context Management**: Use @imports to maintain clean context hierarchy

## Claude Workflow
1. Load AGENTS.md as base context
2. Check agents/MEMORY.md for previous decisions
3. Apply relevant skills from agents/skills/
4. Log technical decisions to agents/MEMORY.md

## Claude-Specific Rules
- Always reference AGENTS.md for base conventions
- Use @import for modular context management
- Leverage Claude's memory capabilities for learning
- Prefer MCP servers over direct file operations
