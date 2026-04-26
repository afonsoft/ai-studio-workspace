# 💻 VS Code / Windsurf - Configurações Otimimizadas

## 📋 Visão Geral

Este diretório contém as configurações, extensões e personalizações do VS Code/Windsurf otimizadas para desenvolvimento moderno com C#/.NET, Angular, e integração com Gemini API.

## 🎯 Foco Principal

- **C#/.NET**: Development completo com Entity Framework, Blazor, e testes
- **Angular**: Frontend moderno com TypeScript e Tailwind CSS
- **Gemini API**: Integração com GitHub Copilot e AI avançada
- **Productividade**: Ferramentas para desenvolvimento ágil e colaborativo
- **Qualidade**: Code quality, formatação e análise estática

## 📁 Estrutura do Diretório

```
vscode/
├── README.md                    # Este arquivo - guia completo
├── settings.json                # Configurações globais otimizadas
├── extensions.json              # Extensões recomendadas por categoria
├── keybindings.json             # Atalhos personalizados C#/.NET
└── install-extensions.sh        # Script de instalação automática
```

## 🚀 Configurações Principais

### settings.json - Otimizações por Hardware

**Hardware Detectado**: 16 cores · 25.4 GB RAM  
**GPUs**: Intel Iris Xe; NVIDIA GeForce RTX 2050

#### 🎨 Editor & Performance
- **Formatação automática** ao salvar com C# formatter padrão
- **Bracket pair colorization** para melhor leitura de código
- **Cursor animations** suaves (GPU acceleration)
- **Minimap** habilitado para navegação rápida
- **Smooth scrolling** em listas e editor
- **Large file optimizations** para arquivos >2MB

#### 💾 Memória & Recursos
- **Max memory for large files**: 3072MB (apropriado para 24GB RAM)
- **Editor limit**: 20 abas simultâneas
- **Tab limit**: 20 abas (balance para 24GB RAM)
- **File watcher exclusions** para reduzir I/O

#### 🔧 Terminal & Shell
- **Default profile**: PowerShell (Windows)
- **GPU acceleration**: ON (melhor performance visual)
- **Scrollback**: 5000 linhas (2MB por terminal)
- **WSL integration** para desenvolvimento Linux

#### 🌐 Rede & Timeout
- **System certificates V2**: SSL/HTTPS fix
- **HTTP timeout**: 120s (2 minutos)
- **Auto-update extensions**: habilitado

## 📦 Extensões Organizadas por Categoria

### 🚀 AI & Code Completion
- **GitHub Copilot**: Code completion avançado
- **GitHub Copilot Chat**: Assistente de IA conversacional
- **Intellicode**: Sugestões baseadas em contexto

### 💻 C# / .NET Development
- **C# Dev Kit**: Development completo .NET
- **Blazor**: Framework web components
- **Dotnet Runtime**: Runtime .NET integrado
- **Dotnet Core Snippets**: Snippets para .NET
- **Dotnet Pack**: Pacote de extensões .NET
- **Test Explorer**: Testes unitários integrados

### 🌐 Web Development (Angular & Frontend)
- **Angular Extension**: Templates e snippets Angular
- **John Papa Angular**: Best practices Angular
- **TypeScript Next**: Suporte completo TS/JS
- **Tailwind CSS**: Framework CSS utility-first
- **HTML CSS Support**: Formatação e snippets
- **Jest**: Framework de testes JavaScript
- **Auto Rename Tag**: Renomear tags HTML em pares
- **Auto Close Tag**: Fechar tags automaticamente

### 🐳 Docker & Containers
- **Docker Extension**: Gerenciamento de containers

### 🔧 Git & Version Control
- **GitLens**: Superpowers para Git
- **GitHub Pull Requests**: Integration com GitHub
- **GitIgnore**: Gerenciamento de .gitignore

### 🗄️ Database & Data
- **SQL Server**: Integration com Microsoft SQL
- **REST Client**: Testes de API

### 🎨 Code Quality & Formatting
- **Prettier**: Formatação de código
- **EditorConfig**: Configurações consistentes

### 📋 Productivity & Utilities
- **Path Intellisense**: Autocomplete de caminhos
- **NPM Intellisense**: Autocomplete de pacotes NPM
- **Bracket Pair Colorizer**: Cores para pares de colchetes

## 🎨 Temas & Personalização

### Temas Recomendados
- **Material Icon Theme**: Ícones modernos
- **VSCode Icons**: Ícones oficiais VS Code

### Temas de Editor
O projeto inclui extensões de ícones para melhor visualização, mas temas de editor são opcionais e podem ser instalados conforme preferência pessoal.

## 🔧 Atalhos Personalizados (keybindings.json)

### C# Development
- `Ctrl+Shift+C`: Gerar método async
- `Ctrl+Shift+T`: Rodar testes no contexto
- `Ctrl+Shift+D`: Debug testes no contexto
- `Ctrl+Shift+F`: Formatar documento

### GitHub Copilot
- `Ctrl+L`: Quick chat
- `Ctrl+I`: Editar com input
- `Ctrl+Shift+\`: Focar input do Copilot

### Terminal & Navegação
- `Ctrl+``: Toggle terminal
- `Ctrl+Shift+``: Split terminal
- `Ctrl+Shift+E`: Explorer
- `Ctrl+Shift+P`: Command palette

## 🧪 Testing & Debug

### Configurações de Teste
- **xUnit Integration**: Testes unitários .NET
- **Test Explorer**: Interface visual de testes
- **Code Coverage**: Análise de cobertura
- **Test Adapters**: Integração com frameworks

### Debug Configuration
- **.NET Launch**: Debug de aplicações web
- **Docker Debug**: Debug em containers
- **Attach**: Anexar a processos existentes

## 🌐 Web Development Setup

### Angular Configuration
```json
{
  "angular.ng-template": true,
  "typescript.preferences.includePackageJsonAutoImports": "on"
}
```

### Tailwind CSS
```json
{
  "tailwindCSS.includeLanguages": ["html", "typescript", "javascript"],
  "tailwindCSS.experimental.classRegex": ["clsx\\(([^)]*)\\)"]
}
```

### Live Server
```json
{
  "liveServer.settings.port": 5500,
  "liveServer.settings.root": "/src"
}
```

## 🐳 Docker Integration

### Docker Compose
- **Syntax highlighting** para docker-compose.yml
- **IntelliSense** para Dockerfiles
- **Container management** integrado
- **Remote development** em containers

### Configurações
```json
{
  "docker.extension.enableComposeLanguageServer": true,
  "docker.images.defaultRegistry": "docker.io"
}
```

## 🔧 Git Integration Avançada

### GitLens Features
- **Code Lens**: Informações de commit inline
- **File History**: Histórico de alterações
- **Repository Graph**: Visualização de branches
- **Blame Annotations**: Autoria de código

### GitHub Integration
- **Pull Requests**: Criação e review de PRs
- **GitHub Actions**: Workflow integration
- **Issues**: Gerenciamento de issues

## 🎯 Productivity Tips

### Snippets Personalizados
- **Controller ASP.NET Core**: `controller`
- **Repository Pattern**: `repository`
- **Unit Test xUnit**: `test`
- **Angular Component**: `component`

### Workspace Management
- **Multi-root workspaces**: Projetos relacionados
- **Folder nesting**: Agrupamento de arquivos
- **File exclusions**: Foco em código relevante

## 🚀 Performance Optimization

### Para 24GB RAM
- **Editor limit**: 20 arquivos abertos
- **Large files**: 3GB memory allocation
- **Terminal history**: 5000 linhas
- **Search results**: 15000 itens

### Para 16 Cores CPU
- **Background analysis**: 3 projetos .NET
- **Type checking**: Basic mode
- **Auto-imports**: Enabled (com CPU sobrando)

## 🔒 Security & Privacy

### Configurações
- **Workspace trust**: Habilitado com cuidado
- **Telemetry**: Desabilitada (opcional)
- **Certificate validation**: System certificates V2
- **Secure connections**: HTTPS por padrão

## 📚 Documentação Adicional

- [.NET Setup Guide](https://docs.microsoft.com/en-us/dotnet/core/)
- [Angular Documentation](https://angular.io/docs)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Git Workflow](https://github.com/features/codespaces)

## 🔄 Instalação Automática

```bash
# Windows
./install-extensions.bat

# Linux/macOS  
./install-extensions.sh
```

## 🎉 Benefícios

✅ **Development focado** C#/.NET + Angular  
✅ **AI integration** com GitHub Copilot  
✅ **Extensões otimizadas** para desenvolvimento rápido  
✅ **Quality tools** para código limpo  
✅ **Docker integration** para containerização  
✅ **Git avançado** para colaboração  
✅ **Setup enxuto** com apenas extensões essenciais  

---

**Setup completo para desenvolvimento moderno!** 🚀

Configurado para extrair o máximo do seu hardware com ferramentas profissionais.
