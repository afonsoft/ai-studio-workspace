# Changelog
Todas as alterações notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.1.0/),
e este projeto adere ao [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [2.1.0] - 2026-03-18

### Adicionado
- `3a8b4c6` | 2026-03-18 | Afonso Dutra Nogueira Filho — feat: update README with GitHub Copilot agents configuration guide
- **GitHub Copilot Agents** com 9 skills especializadas .NET
- **Guia completo de configuração** para VS Code e Windsurf
- **Integração OpenHands** com agents no workspace
- **Exemplos práticos** de uso com prompts especializados
- **Documentação atualizada** com referências removidas ao Ollama

### Alterado
- **SETUP-VSCODE.md** migrado de Ollama/Continue para GitHub Copilot
- **workspace/README.md** removidas referências ao Ollama
- **README-OPTIMIZACAO.md** atualizado para Gemini API
- **openhands/README.md** configurado para Gemini API
- **Documentação completa** sem dependências de Ollama
- **Links e referências** atualizadas para nova arquitetura

### Removido
- Todas as referências ao **Ollama** da documentação
- Configurações de **Continue** e Qwen 2.5 Coder
- Dependências de **GPU NVIDIA** nos guias de setup
- Links quebrados para serviços removidos

### Corrigido
- Remoção completa de menções a `ollama` em todos os arquivos
- Atualização de comandos e exemplos para Gemini API
- Consistência na documentação sem referências obsoletas

## [2.0.0] - 2026-03-17

### Alterado (BREAKING CHANGES)
- **Migração completa de Ollama para Gemini API**
- Removida dependência de GPU NVIDIA (setup universal)
- Removidos serviços Ollama e Open-WebUI
- Simplificação da arquitetura para apenas OpenHands

### Adicionado
- `a796691` | 2026-03-17 | Afonso Dutra Nogueira Filho — feat: increase memory threshold for low-resource configuration
- `9d6c232` | 2026-03-17 | Afonso Dutra Nogueira Filho — fix: adjust GPU memory warning threshold to 4GB
- `54e65ef` | 2026-03-17 | Afonso Dutra Nogueira Filho — fix: resolve line ending issues in start.sh
- `a67ea62` | 2026-03-17 | Afonso Dutra Nogueira Filho — feat: add Gemini API key validation to start.sh
- `c1092d9` | 2026-03-17 | Afonso Dutra Nogueira Filho — fix: update config.json to use Gemini API provider
- **Validação automática de API Key Gemini** no start.sh
- **docker-compose.low-resource.yml** para sistemas com recursos limitados
- **Configuração simplificada** com validação interativa
- **Setup universal** funciona em qualquer hardware

### Removido
- Serviço Ollama (dependência local de LLM)
- Serviço Open-WebUI (interface web)
- Configurações específicas de GPU NVIDIA
- Dependência de hardware especializado

### Alterado
- **85% de redução** no consumo de memória total
- **docker-compose.yml** otimizado para Gemini API
 - **settings.json** configurado para Gemini 2.5 Flash
- **start.sh** com validação automática de API Key
- **README.md** atualizado para refletir nova arquitetura
- **Documentação MCP** simplificada e focada

### Corrigido
- Problemas de line endings em scripts Windows
- Validação de API Key em múltiplos arquivos
- Compatibilidade cross-platform aprimorada

### Dependências / Versões
- OpenHands image: `docker.openhands.dev/openhands/openhands:1.5`
 - LLM Provider: **Google Gemini API** (gemini-3.1-flash-lite-preview)
- Agent Server: `ghcr.io/openhands/agent-server:1.12.0-python`
- **Requisito**: API Key Gemini (https://aistudio.google.com/app/apikey)

## [1.3.0] - 2025-11-11

## [Unreleased] - 2026-01-01

### Adicionado
- `cbad673` | 2026-01-01 | Afonso Dutra Nogueira Filho — feat: Update openhands version

### Corrigido
- `1f12141` | 2025-11-20 | Afonso Dutra Nogueira Filho — fix: update Dockerfile to enhance dependency installation and streamline .NET SDK setup

### Dependências / Versões
- OpenHands image: `docker.openhands.dev/openhands/openhands:1.1`
- Runtime base image: `docker.openhands.dev/openhands/runtime:1.1-nikolaik`
- .NET SDKs instalados no runtime: `8` e `10`
- Ollama: `ollama/ollama:latest` (modelo padrão: `devstral:24b`)


### Adicionado
- Atualizações na documentação (README e CHANGELOG).
- Preparação da branch `feature/update` com ajustes de documentação.
- Melhorias na organização da estrutura do repositório.

### Alterado
- Atualização das instruções de instalação e validação dos scripts.
- Pequenas correções de links e formatação no README.

### Corrigido
- Ajustes nas instruções de execução para Windows.
- Correção na sintaxe de alguns blocos de código.

## [1.2.0] - 2025-10-01

### Adicionado
- Atualização do OpenHands para versão 0.58
- Melhorias na documentação com estrutura mais clara
- Adição de seção detalhada de variáveis de ambiente
- Nova estrutura hierárquica do repositório no README

### Alterado
- Otimização das configurações de contexto do LLM (32768 tokens)
- Atualização das instruções de instalação e execução
- Refinamento da documentação técnica
- Melhorias na formatação e organização do README

### Corrigido
- Ajustes nos links internos da documentação
- Correção de inconsistências na documentação

## [1.1.0] - 2025-09-12
### Adicionado
- Atualização do OpenHands para versão 0.56
- Devstral 24B definido como modelo padrão
- Novas otimizações de memória e paralelismo
- Melhoria na documentação de configurações de hardware

### Alterado
- Ajuste nos parâmetros de paralelismo para melhor gerenciamento de memória
- Atualização das recomendações de modelos por perfil de hardware
- Refinamento das configurações de GPU para diferentes modelos de placas

## [1.0.0] - 2025-08-28

### Adicionado
- Configuração inicial do ambiente de desenvolvimento com Docker
- Integração com OpenHands, Ollama e Web UI
- Suporte a desenvolvimento .NET e Node.js
- Scripts de inicialização para Windows e Linux/macOS
- Configurações do VS Code e extensões recomendadas
- Documentação completa no README.md

### Configurado
- Ambiente Docker com suporte a GPU NVIDIA
- .NET SDKs 8 e 10
- Node.js com NVM
- Configurações do Ollama para modelo devstral:latest
- Autenticação básica para Web UI
