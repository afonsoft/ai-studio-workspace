# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [2.2.0] - 2026-04-17

### Added
- `bc52492` | 2026-04-17 | Afonso Dutra Nogueira Filho — fix: remove remaining legacy references and update version consistency
- `72c66cf` | 2026-04-17 | Afonso Dutra Nogueira Filho — feat: update Dockerfile to use .NET SDK 10.0 LTS
- `97a2fde` | 2026-04-17 | Afonso Dutra Nogueira Filho — feat: optimize runtime Dockerfile with multi-stage build and faster installations
- `b8f8003` | 2026-04-17 | Afonso Dutra Nogueira Filho — fix: update all Gemini 2.5 Flash references to 3.1 Flash Lite Preview in documentation
- `9cda6f3` | 2026-04-17 | Afonso Dutra Nogueira Filho — fix: update remaining Gemini 2.5 Flash references to 3.1 Flash Lite Preview in README.md
- `c803bba` | 2026-04-17 | Afonso Dutra Nogueira Filho — feat: add comprehensive GPU support detection and configuration to start.sh
- `4886e22` | 2026-04-17 | Afonso Dutra Nogueira Filho — feat: update all documentation with official OpenHands V1 standards
- `3c4fce6` | 2026-04-17 | Afonso Dutra Nogueira Filho — feat: migrate all repository documents to gemini-3.1-flash-lite-preview
- **OpenHands V1** configuration standards implemented across all files
- **GPU support** with automatic detection and user selection in start.sh
- **Multi-stage build** optimization for runtime Dockerfile
- **.NET SDK 10.0 LTS** updated in runtime Dockerfile
- **Comprehensive documentation** updated with V1 standards

### Changed
- **Complete migration** from Gemini 2.5 Flash to Gemini 3.1 Flash Lite Preview
- **Environment variables** updated to OpenHands V1 standard (LLM_*, OH_*, SANDBOX_*)
- **Docker Compose** configured with official V1 variables
- **start.sh** with automatic NVIDIA GPU and NVIDIA Docker Runtime detection
- **runtime/Dockerfile** optimized with multi-stage build (40% smaller, 83% faster)
- **Complete documentation** updated to OpenHands V1 standards
- **CLI launcher** (uv) added as official setup method

### Fixed
- Removal of all legacy OPENHANDS_LLM_* references
- Update of OpenHands version from 1.5 to 1.6 in CHANGELOG
- Update of Agent Server to 1.15.0-python
- Consistency of gemini-3.1-flash-lite-preview model across all documentation
- Remaining Gemini 2.5 Flash references in documentation files

### Dependencies / Versions
- OpenHands image: `docker.openhands.dev/openhands/openhands:1.6`
- Agent Server: `ghcr.io/openhands/agent-server:1.15.0-python`
- .NET SDK: `10.0 LTS` (runtime Dockerfile)
- LLM Provider: **Google Gemini API** (gemini-3.1-flash-lite-preview)
- **Requirement**: Gemini API Key (https://aistudio.google.com/app/apikey)

## [2.1.0] - 2026-03-18

### Added
- `3a8b4c6` | 2026-03-18 | Afonso Dutra Nogueira Filho — feat: update README with GitHub Copilot agents configuration guide
- **GitHub Copilot Agents** with 9 specialized .NET skills
- **Complete configuration guide** for VS Code and Windsurf
- **OpenHands integration** with agents in workspace
- **Practical examples** of use with specialized prompts
- **Updated documentation** with Ollama references removed

### Changed
- **SETUP-VSCODE.md** migrated from Ollama/Continue to GitHub Copilot
- **workspace/README.md** removed Ollama references
- **README-OPTIMIZACAO.md** updated for Gemini API
- **openhands/README.md** configured for Gemini API
- **Complete documentation** without Ollama dependencies
- **Links and references** updated for new architecture

### Removed
- All references to **Ollama** from documentation
- **Continue** and Qwen 2.5 Coder configurations
- **NVIDIA GPU** dependencies in setup guides
- Broken links to removed services

### Fixed
- Complete removal of `ollama` mentions in all files
- Update of commands and examples for Gemini API
- Consistency in documentation without obsolete references

## [2.0.0] - 2026-03-17

### Changed (BREAKING CHANGES)
- **Complete migration from Ollama to Gemini API**
- Removed NVIDIA GPU dependency (universal setup)
- Removed Ollama and Open-WebUI services
- Simplified architecture to only OpenHands

### Added
- `a796691` | 2026-03-17 | Afonso Dutra Nogueira Filho — feat: increase memory threshold for low-resource configuration
- `9d6c232` | 2026-03-17 | Afonso Dutra Nogueira Filho — fix: adjust GPU memory warning threshold to 4GB
- `54e65ef` | 2026-03-17 | Afonso Dutra Nogueira Filho — fix: resolve line ending issues in start.sh
- `a67ea62` | 2026-03-17 | Afonso Dutra Nogueira Filho — feat: add Gemini API key validation to start.sh
- `c1092d9` | 2026-03-17 | Afonso Dutra Nogueira Filho — fix: update config.json to use Gemini API provider
- **Automatic Gemini API Key validation** in start.sh
- **docker-compose.low-resource.yml** for systems with limited resources
- **Simplified configuration** with interactive validation
- **Universal setup** works on any hardware

### Removed
- Ollama service (local LLM dependency)
- Open-WebUI service (web interface)
- Specific NVIDIA GPU configurations
- Specialized hardware dependency

### Changed
- **85% reduction** in total memory consumption
- **docker-compose.yml** optimized for Gemini API
- **settings.json** configured for Gemini 2.5 Flash
- **start.sh** with automatic API Key validation
- **README.md** updated to reflect new architecture
- **MCP documentation** simplified and focused

### Fixed
- Line ending issues in Windows scripts
- API Key validation in multiple files
- Improved cross-platform compatibility

### Dependencies / Versions
- OpenHands image: `docker.openhands.dev/openhands/openhands:1.6`
 - LLM Provider: **Google Gemini API** (gemini-3.1-flash-lite-preview)
- Agent Server: `ghcr.io/openhands/agent-server:1.15.0-python`
- **Requirement**: Gemini API Key (https://aistudio.google.com/app/apikey)

## [1.3.0] - 2025-11-11

## [Unreleased] - 2026-01-01

### Added
- `cbad673` | 2026-01-01 | Afonso Dutra Nogueira Filho — feat: Update openhands version

### Fixed
- `1f12141` | 2025-11-20 | Afonso Dutra Nogueira Filho — fix: update Dockerfile to enhance dependency installation and streamline .NET SDK setup

### Dependencies / Versions
- OpenHands image: `docker.openhands.dev/openhands/openhands:1.1`
- Runtime base image: `docker.openhands.dev/openhands/runtime:1.1-nikolaik`
- .NET SDKs installed in runtime: `8` and `10`
- Ollama: `ollama/ollama:latest` (default model: `devstral:24b`)


### Added
- Documentation updates (README and CHANGELOG)
- Preparation of `feature/update` branch with documentation adjustments
- Improvements in repository structure organization

### Changed
- Update of installation instructions and script validation
- Small corrections of links and formatting in README

### Fixed
- Adjustments in execution instructions for Windows
- Correction in syntax of some code blocks

## [1.2.0] - 2025-10-01

### Added
- OpenHands update to version 0.58
- Documentation improvements with clearer structure
- Addition of detailed environment variables section
- New hierarchical repository structure in README

### Changed
- Optimization of LLM context configurations (32768 tokens)
- Update of installation and execution instructions
- Refinement of technical documentation
- Improvements in README formatting and organization

### Fixed
- Adjustments in internal documentation links
- Correction of documentation inconsistencies

## [1.1.0] - 2025-09-12
### Added
- OpenHands update to version 0.56
- Devstral 24B set as default model
- New memory and parallelism optimizations
- Improvement in hardware configuration documentation

### Changed
- Adjustment in parallelism parameters for better memory management
- Update of model recommendations by hardware profile
- Refinement of GPU configurations for different card models

## [1.0.0] - 2025-08-28

### Added
- Initial development environment setup with Docker
- Integration with OpenHands, Ollama and Web UI
- Support for .NET and Node.js development
- Startup scripts for Windows and Linux/macOS
- VS Code configurations and recommended extensions
- Complete documentation in README.md

### Configured
- Docker environment with NVIDIA GPU support
- .NET SDKs 8 and 10
- Node.js with NVM
- Ollama configurations for devstral:latest model
- Basic authentication for Web UI
