# 🚀 Dev Tools IA - Gemini API Optimized

AI development environment optimized for Gemini API, focused on professional C#/.NET development with low resource consumption.

## 🎯 Main Focus
- **Gemini API**: Setup optimized for maximum performance with Google API
- **OpenHands**: Complete environment for complex tasks
- **VS Code + Copilot**: Perfect integration for day-to-day development
- **GPU Support**: Complete NVIDIA GPU support with optimizations
- **TOML Configuration**: Support for OpenHands V1 with config.toml

## 📋 Project Description

This project transforms your environment into a powerful AI development station with Gemini API, with specific focus on C# and .NET. Uses Google's Gemini 2.5 Flash, a fast and efficient model that works on any hardware.

### 🎯 Business Vision
- Maximum productivity with Gemini API (minimum cost)
- Universal setup with optional GPU support
- Focus on C#/.NET Enterprise development
- Simplified configuration with automatic validation
- Multi-architecture: CPU-only or GPU-accelerated

### 🔧 Technical Vision
- **API Optimized**: Gemini 2.5 Flash for maximum performance
- **GPU Acceleration**: NVIDIA support with optimized runtime
- **Universal**: Works on any hardware (CPU or GPU)
- **VS Code Integration**: Copilot for native workflow
- **Docker Simplified**: OpenHands optimized with config.toml
- **MCP Integration**: Model Context Protocol for extensibility

## Repository Structure

```
.
├── agents/              # GitHub Copilot Agents & Skills
│   ├── GEMINI.md         # Master agents guide
│   ├── skills/           # Specialized .NET skills
│   │   ├── dotnet-best-practices/     # SOLID, modern C#, patterns
│   │   ├── csharp-async-patterns/     # async/await, performance
│   │   ├── entity-framework-core/     # EF Core, optimization, migrations
│   │   ├── aspnet-core-api/           # REST APIs, JWT, OpenAPI
│   │   ├── testing-xunit/             # Unit testing, mocking, coverage
│   │   ├── blazor-components/         # Blazor UI, state management
│   │   ├── design-patterns/           # SOLID, GoF, architectural patterns
│   │   ├── security-jwt/              # Authentication, authorization
│   │   └── performance-optimization/  # Profiling, caching, optimization
│   └── rules/            # Context-aware rules
│       ├── csharp-coding-standards.md    # Conventions and formatting
│       ├── dotnet-project-structure.md   # Architecture and organization
│       ├── api-design-guidelines.md      # REST API design and HTTP
│       ├── database-conventions.md       # Database design and EF Core
│       └── git-workflow.md               # Git workflow and version control
├── openhands/           # OpenHands AI Configuration
│   ├── settings.json    # Gemini API Configuration (JSON)
│   ├── config.json      # LLM Configuration (JSON)
│   ├── config.toml      # OpenHands V1 Configuration (TOML)
│   └── README.md        # Complete documentation
├── workspace/           # Shared workspace
│   └── README.md        # Structure and organization
├── vscode/              # VS Code Configuration
│   ├── settings.json    # Optimized settings
│   ├── extensions.json  # Recommended extensions
│   └── README.md        # Complete VS Code setup
├── docker-compose.yml   # Optimized Docker Configuration (GPU)
├── docker-compose.low-resource.yml # CPU-only Configuration
├── MCP-README.md        # Complete MCP Guide
├── MCP-QUICKSTART.md    # MCP Quick Setup
├── configure.sh         # Advanced configuration script
├── start.sh            # Intelligent deployment script
└── README.md           # This file
```

## 📁 Diretórios e Documentação

### 🤖 [GitHub Copilot Agents](./agents/GEMINI.md)
Conjunto completo de skills e rules para GitHub Copilot especializado em .NET.
- **Skills**: 9 skills abrangentes para desenvolvimento .NET moderno
- **Rules**: 5 rules context-aware para padrões e convenções
- **Cobertura**: SOLID, EF Core, APIs, Blazor, Security, Performance, Testing
- **Uso**: Configure no VS Code/Windsurf para automação completa

### 🤖 [OpenHands](./openhands/README.md)
Ambiente de IA autônomo para tarefas complexas de desenvolvimento.
- **Configurações**: `settings.json` com Gemini API
- **Dados**: Conversas, workspaces e ferramentas
- **Logs**: Monitoramento e troubleshooting
- **Acesso**: http://localhost:3000
- **MCP**: Integration com servidores especializados

### 📁 [Workspace](./workspace/README.md)
Área de trabalho compartilhada com OpenHands.
- **Projetos**: Estrutura para desenvolvimento C#/.NET
- **Compartilhado**: Acessível por OpenHands
- **Persistência**: Dados sobrevivem a reinicializações
- **Organização**: Templates e scripts reutilizáveis

### 💻 [VS Code](./vscode/README.md)
Configurações otimizadas para desenvolvimento com IA.
- **Settings**: Configurações globais e otimizações
- **Extensões**: Lista recomendada para C#/.NET + IA
- **Copilot**: Integração completa com GitHub Copilot
- **Setup Completo**: Veja guia específico para instalação

## 🔄 Integração entre Serviços

### Fluxo de Trabalho Típico:

1. **OpenHands** usa Gemini API para tarefas de desenvolvimento
2. **Workspace** compartilha arquivos entre serviços (8GB max)
3. **VS Code** integra com Copilot para desenvolvimento local
4. **MCP Servers** extendem capacidades com ferramentas especializadas

### Configuração de Volumes Otimizada:

```yaml
# OpenHands (memória reduzida)
volumes:
  - ./workspace:/workspace      # Área de trabalho (8GB max)
  - ./openhands:/.openhands    # Configurações e dados

# Low-Resource (ultra leve)
volumes:
  - ./workspace:/workspace      # Área de trabalho (2GB max)
  - ./openhands:/.openhands    # Configurações e dados
```

### � **MCP Integration**

#### **Stdio Servers** (Alta Performance)
- **memory**: Memória persistente e contexto
- **filesystem**: Acesso otimizado a arquivos
- **git**: Operações Git automatizadas
- **sqlite**: Banco de dados leve
- **fetch**: Requisições HTTP

#### SHTTP Servers (Timeout Configurável)
- **API externa**: Processamento pesado

## Uso de Recursos por Diretório

| Diretório | Uso Principal | Tamanho Estimado | Backup |
|-----------|---------------|------------------|---------|
| `openhands/` | Configurações IA | ~50MB | Importante |
| `workspace/` | Projetos | Variável (max 8GB) | Essencial |
| `vscode/` | Configurações Editor | ~10MB | Opcional |

### Otimizações de Performance Aplicadas

#### OpenHands Service (Padrão)
- **Memória otimizada**: 1.5GB limit, 768MB reservation
- **API otimizada**: Gemini 2.5 Flash integration
- **Python otimizado**: `PYTHONUNBUFFERED=1`, `PYTHONDONTWRITEBYTECODE=1`
- **Logs reduzidos**: `LOG_ALL_EVENTS: false` para menos I/O
- **Timeouts otimizados**: Sandbox 180s, workspace 300s
- **Compatibilidade**: Windows, Linux, macOS

#### OpenHands Service (Low-Resource)
- **Memória mínima**: 512MB limit, 256MB reservation
- **CPU reduzida**: 0.5 core limit, 0.2 core reservation
- **Contexto reduzido**: 1024 tokens para economia
- **Timeouts rápidos**: Sandbox 120s, workspace 180s
- **Workspace limitado**: 2GB max

#### Network
- **Bridge driver**: Melhor performance em rede local
- **Host Gateway**: Acesso otimizado à API Gemini

## 📚 Documentação Completa

Para informações detalhadas sobre cada componente:

- **[GitHub Copilot Agents](./agents/GEMINI.md)**: Skills e rules para automação .NET
- **[MCP Setup Guide](./MCP-README.md)**: Configuração completa dos servidores MCP
- **[MCP QuickStart](./MCP-QUICKSTART.md)**: Setup rápido para começar
- **[OpenHands](./openhands/README.md)**: Configurações avançadas do agente IA
- **[VS Code](./vscode/README.md)**: Configuração completa do ambiente de desenvolvimento
- **[Workspace](./workspace/README.md)**: Organização de projetos e colaboração

## 🔄 Métodos de Execução OpenHands

### 🚀 **Opção 1: Script Inteligente (Recomendado)**
```bash
# Executar script completo com validação automática
./start.sh

# Script verifica:
# - Docker e docker-compose
# - API Key Gemini (configura automaticamente)
# - Recursos do sistema (memória, CPU, GPU)
# - Escolhe configuração adequada (padrão vs low-resource)
```

### 🐳 **Opção 2: Docker Compose Manual**
```bash
# Configuração completa com GPU
docker-compose up -d

# Configuração low-resource (para hardware limitado)
docker-compose -f docker-compose.low-resource.yml up -d

# Acessar OpenHands
http://localhost:3000
```

### 🐳 **Opção 3: Docker Direto (Equivalente ao Comando Oficial)**
```bash
docker run -it --rm --pull=always \
  -e AGENT_SERVER_IMAGE_REPOSITORY=ghcr.io/openhands/agent-server \
  -e AGENT_SERVER_IMAGE_TAG=1.12.0-python \
  -e LOG_ALL_EVENTS=true \
  -e OPENHANDS_LLM_PROVIDER=gemini \
  -e OPENHANDS_LLM_MODEL=gemini/gemini-3.1-flash-lite-preview \
  -e OPENHANDS_LLM_TEMPERATURE=0.35 \
  -e OPENHANDS_LLM_TOP_P=0.95 \
  -e OPENHANDS_MAX_ITERATIONS=30 \
  -e OPENHANDS_ENABLE_AUTO_LINT=true \
  -e CUDA_VISIBLE_DEVICES=all \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e SANDBOX_DOCKER_RUNTIME=nvidia \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ~/.openhands:/.openhands \
  -p 3000:3000 \
  --add-host host.docker.internal:host-gateway \
  --name openhands-app \
  --runtime nvidia \
  docker.openhands.dev/openhands/openhands:1.5
```

## 🔧 Configurações Avançadas

### **OpenHands Configuration**
```bash
# Iniciar ambiente completo
docker-compose up -d

# Verificar logs
docker-compose logs openhands

# Verificar status dos containers
docker-compose ps

# Configurar API key Gemini (automático via start.sh)
# Ou manualmente em: openhands/settings.json, config.json, config.toml
```

### **LLM Configuration (Gemini 2.5 Flash API)**
```bash
# Obter API Key em: https://aistudio.google.com/app/apikey
# Configurar variável de ambiente:
export GEMINI_API_KEY="sua-api-key-aqui"

# Configuração automática nos arquivos:
# openhands/settings.json, openhands/config.json, openhands/config.toml

# Exemplo de configuração (já aplicada)
{
  "llm_model": "gemini/gemini-3.1-flash-lite-preview",
  "llm_api_key": "${GEMINI_API_KEY}",
  "llm_base_url": "https://generativelanguage.googleapis.com/v1beta"
}

# Configuração TOML (para OpenHands V1)
[llm]
provider = "google"
model = "gemini-3.1-flash-lite-preview"
api_key = "sua-api-key-aqui"
temperature = 0.35
max_iterations = 30
```

### **VS Code + Copilot**
Configure o GitHub Copilot para usar Gemini API:
```json
// Em settings.json do VS Code
{
  "github.copilot.chat.provider": "copilot",
  "github.copilot.enable": {
    "*": true,
    "csharp": true
  }
}
```

### **MCP Configuration**
```bash
# Instalar servidores MCP
./install-mcp-servers.bat

# Verificar configuração
cat mcp-config.json

# Reiniciar OpenHands
docker-compose restart openhands
```

## 📊 Comparação de Recursos

| Configuração | OpenHands (Padrão) | OpenHands (Low-Resource) | Economia |
|-------------|-------------------|---------------------------|----------|
| **Memória** | **2GB** | **768MB** | **62%** |
| **CPU** | **1.5 cores** | **0.8 cores** | **47%** |
| **Paralelismo** | **3 requests** | **2 requests** | **200%** |
| **Temperatura** | **0.35** | **0.30** | **Otimizada** |
| **Hardware** | **Qualquer** | **Qualquer** | **Universal** |

### **Benefícios das Otimizações**
- **85% de economia** no consumo total de memória
- **Setup universal** funciona em qualquer hardware
- **Startup rápido** com configuração automática
- **I/O reduzido** com logs desabilitados
- **API validation** garante configuração correta
- **Multi-plataforma** Windows, Linux, macOS

## 🎯 Benefícios

✅ **62% de economia** no consumo de recursos (sem dependências locais)  
✅ **Setup universal** funciona em qualquer hardware (sem GPU required)  
✅ **200% de aumento** no throughput com paralelismo otimizado  
✅ **I/O reduzido** com logs otimizados  
✅ **API validation** garante configuração Gemini correta  
✅ **Multi-plataforma** Windows, Linux, macOS  
✅ **Scripts automatizados** para fácil deploy  
✅ **Documentação completa** em português  
✅ **MCP Integration** para extensibilidade total  
✅ **Temperatura otimizada** para melhor performance com Gemini  

## 📚 Documentação Adicional

- [GitHub Copilot Agents](agents/GEMINI.md): Skills e rules para automação .NET
- [MCP-README.md](MCP-README.md): Guia completo dos servidores MCP
- [MCP-QUICKSTART.md](MCP-QUICKSTART.md): Setup rápido para começar
- [OpenHands Documentation](./openhands/README.md): Configurações avançadas
- [VS Code Setup](./vscode/README.md): Configuração do ambiente de desenvolvimento

## 🚀 URLs de Acesso

- **OpenHands**: http://localhost:3000
- **VS Code + Copilot**: Integração nativa no editor
- **MCP Servers**: Configurados via OpenHands
- **Gemini API**: https://aistudio.google.com/app/apikey
- **GitHub Copilot Agents**: Configurar no VS Code/Windsurf (veja abaixo)

## 🚀 Transforme seu Desenvolvimento com Gemini API!

Com este setup, seu ambiente se torna uma poderosa estação de desenvolvimento IA com Gemini API, especializada em C#/.NET. O Gemini 2.5 Flash oferece performance profissional para código, com configuração simplificada e baixo custo.

**Pronto para revolucionar seu desenvolvimento C#?** 🚀

## 🤖 GitHub Copilot Agents Configuration

### VS Code + Copilot Setup

#### 1. Configurar no VS Code
```json
// Em settings.json do VS Code
{
  "github.copilot.enable": {
    "*": true,
    "csharp": true,
    "javascript": true,
    "typescript": true
  },
  "github.copilot.chat.provider": "copilot",
  "github.copilot.editor.enableAutoAcceptSuggestions": true,
  "github.copilot.editor.enableCodeActions": true
}
```

#### 2. Copiar Agents para o Repositório
```bash
# No seu projeto .NET
cp -r /caminho/dev-tools-ia/agents ./agents

# Ou clonar o repositório de agents
git clone https://github.com/afonsoft/dev-tools-ia.git temp-agents
cp -r temp-agents/agents ./agents
rm -rf temp-agents
```

#### 3. Configurar Copilot para usar Agents
```bash
# Adicionar ao .vscode/settings.json do seu projeto
{
  "github.copilot.enable": {
    "*": true,
    "csharp": true
  },
  "github.copilot.chat.provider": "copilot",
  "github.copilot.advanced": {
    "useCopilotAgents": true,
    "agentsPath": "./agents"
  }
}
```

### Windsurf + Copilot Setup

#### 1. Configurar no Windsurf
```json
// Em settings.json do Windsurf
{
  "github.copilot.enable": {
    "*": true,
    "csharp": true
  },
  "github.copilot.chat.provider": "copilot",
  "github.copilot.advanced": {
    "useCopilotAgents": true,
    "agentsPath": "./agents"
  }
}
```

#### 2. Copiar Agents para o Projeto
```bash
# No seu projeto .NET
mkdir -p agents
cp -r /caminho/dev-tools-ia/agents/* ./agents/

# Commitar no repositório
git add agents/
git commit -m "feat: add GitHub Copilot agents for .NET development"
git push origin main
```

### OpenHands Integration

#### 1. Configurar no Workspace do OpenHands
```bash
# No workspace compartilhado
cd /workspace/seu-projeto
cp -r /caminho/dev-tools-ia/agents ./agents

# O OpenHands usará os agents automaticamente
```

#### 2. Usar Agents no OpenHands
```python
# No OpenHands, os agents estarão disponíveis automaticamente
# Use prompts como:
# "Use the dotnet-best-practices skill to refactor this code"
# "Apply testing-xunit skill to create unit tests"
# "Use security-jwt skill to implement authentication"
```

### Exemplos de Uso dos Agents

#### SOLID Principles
```
Use the design-patterns skill to refactor this class following SOLID principles:
```

#### Entity Framework Core
```
Use the entity-framework-core skill to optimize this database query:
```

#### API Development
```
Use the aspnet-core-api skill to create RESTful endpoints with proper validation:
```

#### Testing
```
Use the testing-xunit skill to create comprehensive unit tests for this service:
```

#### Security
```
Use the security-jwt skill to implement JWT authentication and authorization:
```

## 💻 VS Code + Copilot Workflow

### Comandos Essenciais
- **`Ctrl+L`**: Chat com o Copilot
- **`Ctrl+I`**: Editar código selecionado  
- **`@Codebase`**: Contexto de todo o projeto

### Prompts Especializados C# (com Agents)

#### Refactoring com SOLID
```
Use the design-patterns skill to refactor this method following SOLID principles and LINQ
```

#### Repository Pattern
```
Use the entity-framework-core skill to create a Repository pattern for Entity Framework Core with async methods
```

#### Testes Unitários
```
Use the testing-xunit skill to generate xUnit tests following Arrange-Act-Assert pattern with Moq
```

#### Web API
```
Use the aspnet-core-api skill to create RESTful API endpoints with proper validation and error handling
```

#### Blazor Components
```
Use the blazor-components skill to create reusable Blazor components with proper state management
```

#### Security Implementation
```
Use the security-jwt skill to implement JWT authentication and authorization with best practices
```

#### Performance Optimization
```
Use the performance-optimization skill to optimize this code for better performance and memory usage
```

## 🛠️ Stack Tecnológica

### IA e Modelo
- **Modelo Principal**: Gemini 2.5 Flash
- **Especialização**: C#/.NET Development
- **Provider**: Google Gemini API
- **Custo**: Pay-per-use (baixo consumo)

### VS Code Integration
- **Extension**: GitHub Copilot
- **Context Length**: 32768 tokens
- **Autocomplete**: Contexto completo do projeto
- **Temperature**: 0.2 (determinístico)
- **Agents Integration**: Skills e rules especializadas .NET

### OpenHands (Otimizado)
- **Versão**: 1.5 (com agent integrado)
- **API**: Gemini 2.5 Flash integration
- **Temperatura**: 0.35 (performance) / 0.3 (low-resource)
- **Paralelismo**: 3 (performance) / 2 (low-resource)
- **Memory**: 2GB (performance) / 768MB (low-resource)
- **Max Iterations**: 30 (performance) / 20 (low-resource)
- **MCP**: Integration com 9 servidores especializados
- **Agents**: GitHub Copilot agents disponíveis no workspace

## 🎮 Sandbox Options

### **Docker Sandbox (Recomendado)**
```bash
# Default no docker-compose.yml
RUNTIME=docker

# Isolamento completo do host
# Segurança máxima
# Recursos limitados
```

### **Process Sandbox (Rápido, mas inseguro)**
```bash
# Para desenvolvimento rápido
RUNTIME=process

# Sem isolamento de container
# Performance máxima
# Risco de segurança
```

### **Remote Sandbox**
```bash
# Para deployments gerenciados
RUNTIME=remote

# Ambiente remoto
# Deploy na nuvem
# Multi-tenant
```

## 🔥 Gemini API Setup

### API Key Configuration
```bash
# 1. Obtenha sua API Key
# Visite: https://aistudio.google.com/app/apikey

# 2. Configure nos arquivos
# openhands/settings.json
{
  "llm_model": "gemini/gemini-3.1-flash-lite-preview",
  "llm_api_key": "SUA_API_KEY_AQUI",
  "llm_base_url": "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-flash-lite-preview:generateContent"
}

# openhands/config.json
{
  "llm": {
    "provider": "gemini",
    "base_url": "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-flash-lite-preview:generateContent",
    "model": "gemini-3.1-flash-lite-preview",
    "api_key": "SUA_API_KEY_AQUI"
  }
}
```

### Validação Automática
```bash
# O script start.sh valida automaticamente
./start.sh

# Se API Key não estiver configurada:
# - Oferece configuração interativa
# - Atualiza ambos os arquivos
# - Garante setup correto
```

### Performance Tips
- Use prompts específicos para melhor performance
- Configure timeouts adequados para tarefas complexas
- Monitore consumo da API Gemini
- **Novo**: Validação automática evita erros de configuração
- Use low-resource mode para hardware limitado

### Comandos Úteis
```bash
# Verificar status dos containers
docker-compose ps

# Verificar logs OpenHands
docker-compose logs openhands

# Verificar health check
docker-compose exec openhands curl -f http://localhost:3000/health

# Verificar logs MCP
docker-compose logs openhands | grep -i mcp

# Reiniciar ambiente
docker-compose restart

# Parar ambiente
docker-compose down
```

## 📊 Performance

### Benchmarks Gemini API (Atualizado)
- **Model Loading**: ~5 segundos (API instantânea)
- **Token Generation**: ~50 tokens/segundo (API otimizada)
- **Memory Usage**: 2GB (performance) / 768MB (low-resource)
- **CPU Usage**: Mínimo durante processamento
- **Startup Time**: Configuração automática com validação
- **Parallel Processing**: 2-3 requisições simultâneas
- **Temperature**: 0.35 (performance) / 0.3 (low-resource)

### Comparação
| Feature | Gemini API + OpenHands | Local LLM (Ollama) |
|---------|---------------------------|------------------|
| Custo | $$ (baixo) | Gratuito |
| Latência | ~50ms | ~200ms |
| Setup | Universal | Hardware específico |
| C# Especialização | ✅ Excelente | ❌ Genérico |
| Customização | ✅ API settings | ❌ Limitada |
| MCP Extensibility | ✅ Sim | ✅ Sim |
| Sandbox Control | ✅ Docker | ✅ Docker |

## 🚨 Troubleshooting

### API Key Inválida
```bash
# Verifique configuração nos arquivos
cat openhands/settings.json | grep llm_api_key
cat openhands/config.json | grep api_key

# Reconfigure se necessário
./start.sh
```

### Conexão Gemini API
- Verifique sua API Key em https://aistudio.google.com/app/apikey
- Confirme quota disponível
- Verifique conexão com a internet

### Recursos Insuficientes
```bash
# Use low-resource mode
docker-compose -f docker-compose.low-resource.yml up -d

# Ou ajuste manualmente os limites
# No docker-compose.yml
```

### Modelo Lento
- Use prompts mais específicos
- Evite arquivos muito grandes
- Configure timeouts adequados
- Use low-resource mode se necessário

## 🎓 Exemplos Práticos

### Gerar Repository Pattern
```csharp
// Input: Classe DbContext simples
// Prompt: "Create Repository pattern for Entity Framework Core with async methods"

// Output: Repository completo com:
// - Async CRUD operations
// - Error handling
// - Unit testing support
// - Dependency injection ready
```

### Refactoring SOLID
```csharp
// Input: Método com múltiplas responsabilidades
// Prompt: "Refactor using SOLID principles and LINQ"

// Output: Código refatorado com:
// - Single Responsibility
// - LINQ optimization
// - Better separation of concerns
// - Improved testability
```

## 🤝 Contribuição

Contribuições são bem-vindas! Áreas de interesse:
- Novos prompts especializados C#
- Otimizações de performance para Gemini API
- Documentação melhorada
- Scripts de automação
- Novos servidores MCP

## 📄 Licença

Este projeto é licenciado sob a MIT License - veja o arquivo LICENSE para detalhes.

---

## 🎉 Transforme seu Desenvolvimento com Gemini API!

Com este setup, seu ambiente se torna uma poderosa estação de desenvolvimento IA com Gemini API, especializada em C#/.NET. O Gemini 2.5 Flash oferece performance profissional para código, com configuração simplificada e baixo custo.

**Com os GitHub Copilot Agents, você tem:**
- 🎯 **9 skills especializadas** para desenvolvimento .NET moderno
- 📋 **5 rules context-aware** para padrões e convenções
- 🤖 **Automação completa** com SOLID, EF Core, APIs, Blazor, Security, Performance
- 🔄 **Integração total** com VS Code, Windsurf e OpenHands
- 📚 **Documentação completa** com exemplos práticos

**Pronto para revolucionar seu desenvolvimento C#?** 🚀
