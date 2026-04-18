# 🚀 Setup VS Code + GitHub Copilot + OpenHands para Desenvolvimento .NET

## 📋 Requisitos
- VS Code instalado
- GitHub Copilot ativado
- OpenHands configurado com Gemini 3.1 Flash Lite Preview
- Extensões recomendadas para .NET

## ⚙️ Passo 1: Configurar VS Code + GitHub Copilot

### 1.1 Instalar Extensão GitHub Copilot
1. No VS Code: `Ctrl+Shift+X` (Extensions)
2. Pesquise: `GitHub Copilot`
3. Instale a extensão oficial
4. Faça login com sua conta GitHub

### 1.2 Configurar Copilot para .NET
1. Abra Settings: `Ctrl+,`
2. Configure para desenvolvimento .NET:
```json
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

## 🤖 Passo 2: Configurar OpenHands com Gemini 3.1 Flash Lite Preview

### 2.1 Configurar Variáveis de Ambiente
Defina sua API key do Google Gemini:

**Windows (PowerShell):**
```powershell
$env:GEMINI_API_KEY = "sua-api-key-aqui"
```

**Linux/macOS:**
```bash
export GEMINI_API_KEY="sua-api-key-aqui"
```

### 2.2 Iniciar OpenHands
**Para máxima performance:**
```bash
docker-compose up -d openhands
```

**Para recursos limitados:**
```bash
docker-compose -f docker-compose.low-resource.yml up -d openhands
```

### 2.3 Configurações Otimizadas
O OpenHands está configurado com:
- **Modelo**: Gemini 3.1 Flash Lite Preview
- **Temperatura**: 0.35 (performance) / 0.3 (low-resource)
- **Paralelismo**: 3 (performance) / 2 (low-resource)
- **Memory Budget**: 4GB (performance) / 2GB (low-resource)
- **Timeouts**: Otimizados para respostas rápidas

### 1.3 Copiar Arquivos de Configuração
Copie os arquivos da pasta `vscode/` deste repositório:

#### 📁 Windows (PowerShell/CMD)
```powershell
# Copiar configurações do VS Code
copy vscode\settings.json "%APPDATA%\Code\User\settings.json"

# Copiar atalhos personalizados
copy vscode\keybindings.json "%APPDATA%\Code\User\keybindings.json"

# Copiar extensões recomendadas
copy vscode\extensions.json "%APPDATA%\Code\User\extensions.json"
```

#### 🐧 Linux/macOS (Bash/Zsh)
```bash
# Copiar configurações do VS Code
cp vscode/settings.json ~/.config/Code/User/settings.json

# Copiar atalhos personalizados
cp vscode/keybindings.json ~/.config/Code/User/keybindings.json

# Copiar extensões recomendadas
cp vscode/extensions.json ~/.config/Code/User/extensions.json
```

#### 📂 Estrutura de Arquivos na Pasta VSCode
```
vscode/
├── settings.json              # Configurações otimizadas para .NET
├── keybindings.json          # Atalhos personalizados para C#/.NET
├── extensions.json           # Extensões recomendadas
├── install-extensions.sh     # Script de instalação Linux/macOS
├── install-extensions.bat    # Script de instalação Windows
└── README.md                 # Documentação completa
```

#### ⚡ Comandos Personalizados Disponíveis
- `/refactor` - Refatorar código seguindo SOLID principles
- `/test` - Gerar testes xUnit com Moq
- `/document` - Gerar documentação XML
- `/optimize` - Otimizar performance
- `/repository` - Criar Repository pattern
- `/api` - Criar endpoints Web API
- `/linq` - Converter para LINQ
- `/async` - Converter para async/await
- `/validate` - Adicionar validação
- `/security` - Adicionar medidas de segurança

#### 🎨 Context Providers
- `@codebase` - Contexto completo do projeto
- `@file` - Arquivo atual
- `@directory` - Diretório atual

### 1.4 Verificar Instalação
Após copiar os arquivos:

1. **Reinicie VS Code** para carregar as novas configurações
2. **Verifique Copilot**: Clique no ícone Copilot na barra lateral
3. **Teste modelo**: `Ctrl+L` e digite "Hello, are you working?"
4. **Verifique atalhos**: `Ctrl+Shift+P` > "Preferences: Open Keyboard Shortcuts (JSON)"

### 1.5 Instalar Extensões Recomendadas

#### Opção 1: Script Automático (Recomendado)
Use o script apropriado para seu sistema operacional:

**Windows:**
```cmd
# No PowerShell ou CMD
vscode\install-extensions.bat
```

**Linux/macOS:**
```bash
# No terminal
chmod +x vscode/install-extensions.sh
./vscode/install-extensions.sh
```

#### Opção 2: Manual via VS Code
VS Code perguntará se deseja instalar as extensões recomendadas. Clique em "Install All".

#### Opção 3: Terminal VS Code
```bash
# No VS Code Terminal
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.csdevkit
code --install-extension eamodio.gitlens
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode.vscode-json
```

## 🎯 Passo 3: Configurar GitHub Copilot Agents

### 2.1 Copiar Agents para o Projeto
```bash
# No seu projeto .NET
mkdir -p agents
cp -r /caminho/dev-tools-ia/agents/* ./agents/

# Commitar no repositório
git add agents/
git commit -m "feat: add GitHub Copilot agents for .NET development"
git push origin main
```

### 2.2 Configurar Copilot para usar Agents
```json
// Adicionar ao .vscode/settings.json do seu projeto
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

## 💻 Passo 4: Workflow C#/.NET com Agents + OpenHands

### 4.1 Chat Básico (`Ctrl+L`)
Selecione código e use prompts especializados com agents:

```
Use design-patterns skill to refactor this method following SOLID principles and LINQ
```

```
Use entity-framework-core skill to create a Repository pattern for this DbContext
```

```
Use testing-xunit skill to add comprehensive unit tests for this class
```

### 4.2 Usando OpenHands com Gemini
Para tarefas complexas, use OpenHands em `http://localhost:3000`:

**Para debugging e análise:**
```
Analise este código .NET e identifique possíveis problemas de performance e segurança
```

**Para refatoração complexa:**
```
Refatore este código aplicando padrões de projeto SOLID e melhores práticas .NET
```

**Para criação de APIs:**
```
Crie uma Web API RESTful completa com Entity Framework, validação e Swagger
```

### 4.3 Edit Direto (`Ctrl+I`)
Escreva comentários e deixe a IA gerar:

```csharp
// TODO: Use security-jwt skill to implement JWT authentication
// TODO: Apply aspnet-core-api skill for proper validation
// TODO: Use performance-optimization skill for async handling
```

### 4.4 Contexto Local (`@Codebase`)
Use `@Codebase` no chat para referenciar todo o projeto:

```
@Codebase Use dotnet-best-practices skill to create a service layer following Dependency Injection principles
```

### 4.5 Prompts Especializados C# com Agents

#### Para Entity Framework Core:
```
Use entity-framework-core skill to generate a Repository pattern implementation for this DbContext with async methods, proper error handling, and unit testing support.
```

#### Para Web API:
```
Use aspnet-core-api skill to create RESTful API endpoints with proper HTTP verbs, status codes, validation, and Swagger documentation.
```

#### Para Testes Unitários:
```
Use testing-xunit skill to generate comprehensive xUnit tests for this class using Arrange-Act-Assert pattern, mocking dependencies with Moq.
```

#### Para Blazor:
```
Use blazor-components skill to create reusable Blazor components with proper state management and accessibility features.
```

#### Para Performance:
```
Use performance-optimization skill to optimize this code for better performance and memory usage.
```

## 🔍 Passo 5: Comandos Úteis

### 5.1 Atalhos VS Code + Copilot
- `Ctrl+L`: Abrir chat Copilot
- `Ctrl+I`: Editar código selecionado
- `Ctrl+Shift+\`: Focar input Copilot
- `Ctrl+Shift+/`: Comandos slash Copilot
- `Ctrl+Shift+P`: "Copilot: " para comandos especiais

### 5.2 Atalhos Personalizados C#/.NET
- `Ctrl+Shift+C`: Gerar código async
- `Ctrl+Shift+T`: Rodar testes no contexto
- `Ctrl+Shift+R`: Refatorar código
- `Ctrl+Shift+M`: Adicionar usings faltantes
- `Ctrl+Shift+U`: Remover usings não utilizados

## 🚨 Dicas Profissionais

### Performance com Agents + OpenHands
1. **Context menor = Mais rápido**: Use skills específicas
2. **Evite arquivos >1000 linhas**: Divida em classes menores
3. **Use prompts diretos**: Seja específico na skill desejada
4. **OpenHands para tarefas complexas**: Use para debugging e refatoração pesada
5. **Copilot para tarefas rápidas**: Autocomplete e pequenas edições

### Configuração MCP Servers
O projeto inclui configuração MCP com:
- **Memory**: Armazenamento persistente (1GB)
- **Sequential Thinking**: Raciocínio estruturado
- **Fetch**: Acesso à web
- **Filesystem**: Operações de arquivo
- **Git**: Controle de versão
- **SQLite**: Banco de dados local
- **Puppeteer**: Automação web
- **Shadcn UI**: Componentes UI
- **DeepWiki**: Documentação GitHub

### Troubleshooting

**OpenHands não inicia:**
```bash
# Verificar se Docker está rodando
docker ps

# Verificar logs
docker-compose logs openhands
```

**Gemini API key não funciona:**
1. Verifique se a API key está correta
2. Confirme se a API Gemini está ativada
3. Verifique variável de ambiente

**Arquivos não encontrados:**
```bash
# Windows - Verificar caminhos
echo %APPDATA%
dir "%APPDATA%\Code\User"

# Linux/macOS - Verificar caminhos  
echo ~/.config/Code/User
ls -la ~/.config/Code/User
```

**Copilot não reconhece configuração:**
1. Verifique se o caminho está correto:
   - Windows: `%APPDATA%\Code\User\settings.json`
   - Linux/macOS: `~/.config/Code/User/settings.json`
2. Reinicie VS Code completamente
3. Verifique se a extensão Copilot está instalada

**Atalhos não funcionam:**
1. Abra `Ctrl+Shift+P` > "Preferences: Open Keyboard Shortcuts (JSON)"
2. Verifique se o arquivo `keybindings.json` foi copiado corretamente
3. Reinicie VS Code

**Agents não funcionando:**
1. Verifique se a pasta `agents/` existe no projeto
2. Confirme o `agentsPath` no settings.json
3. Reinicie VS Code para carregar os agents

## 🎉 Exemplo Completo: Gerar Testes xUnit com Agents + OpenHands

### Usando GitHub Copilot:
1. Selecione uma classe C#
2. `Ctrl+L` para abrir chat
3. Prompt com agent:
```
@Codebase Use testing-xunit skill to generate comprehensive xUnit tests for this repository class following these requirements:
- Use Arrange-Act-Assert pattern
- Mock dependencies with Moq
- Test all public methods
- Include edge cases and error scenarios
- Use meaningful test names
- Add Theory tests for parameter validation
```

### Usando OpenHands para análise complexa:
1. Abra `http://localhost:3000`
2. Cole o código completo
3. Prompt:
```
Analise esta classe .NET e gere:
1. Testes unitários completos com xUnit e Moq
2. Análise de coverage de código
3. Sugestões de refatoração para melhorar testabilidade
4. Identificação de code smells e anti-padrões
```

## ✅ Verificação Final

Após seguir todos os passos, verifique:

### ✅ VS Code Configurado
- [ ] Extensão GitHub Copilot instalada
- [ ] Configurações copiadas para pasta correta
- [ ] Atalhos personalizados funcionando
- [ ] Extensões recomendadas instaladas

### ✅ GitHub Copilot Funcionando
- [ ] Login efetuado no GitHub Copilot
- [ ] Copilot respondendo ao "Hello"
- [ ] Autocomplete funcionando
- [ ] Comandos slash disponíveis

### ✅ OpenHands com Gemini Configurado
- [ ] API key do Gemini configurada
- [ ] OpenHands rodando em localhost:3000
- [ ] Gemini 3.1 Flash Lite Preview respondendo
- [ ] Configurações de performance aplicadas

### ✅ Agents Configurados
- [ ] Pasta `agents/` copiada para o projeto
- [ ] Skills disponíveis no chat
- [ ] Contexto `@Codebase` funcionando com agents
- [ ] Prompts especializados respondendo

### ✅ MCP Servers Funcionando
- [ ] Servidores MCP configurados
- [ ] Memory server ativo
- [ ] Fetch e filesystem funcionando
- [ ] Integração com OpenHands operacional

Agora você tem um ambiente completo com GitHub Copilot para desenvolvimento rápido e OpenHands com Gemini para tarefas complexas! 🚀
