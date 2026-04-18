# 🤖 OpenHands - Ambiente de IA Autônomo

## 📋 Visão Geral

Este diretório contém as configurações e dados do OpenHands, o ambiente de IA autônomo que permite execução de tarefas complexas com acesso a ferramentas e capacidades de programação.

## 📁 Estrutura do Diretório

```
openhands/
├── README.md                    # Este arquivo
├── settings.json                # Configurações principais do OpenHands
├── config.json                  # Configurações adicionais
├── data/                        # Dados persistentes
│   ├── conversations/           # Histórico de conversas
│   ├── workspaces/              # Workspaces de usuários
│   ├── tools/                   # Configurações de ferramentas
│   └── cache/                   # Cache de respostas
├── logs/                        # Logs do sistema
│   ├── app.log                  # Logs da aplicação
│   ├── agent.log                # Logs do agente
│   └── error.log                # Logs de erros
├── plugins/                     # Plugins personalizados
│   ├── custom-tools/            # Ferramentas customizadas
│   └── extensions/              # Extensões do sistema
└── backups/                     # Backups automáticos
    ├── settings-20240307.json
    └── conversations-20240307.tar.gz
```

## 🎯 Propósito

### O que é armazenado aqui:

1. **Configurações**: Parâmetros do LLM, timeouts, limites
2. **Conversas**: Histórico completo de interações
3. **Workspaces**: Ambientes de trabalho por usuário/sessão
4. **Ferramentas**: Configurações de ferramentas disponíveis
5. **Logs**: Registros detalhados de operações

### Por que este diretório é importante:

- **Persistência**: Mantém estado entre reinicializações
- **Personalização**: Permite configurações específicas por usuário
- **Debug**: Facilita troubleshooting com logs detalhados
- **Backup**: Protege dados importantes do sistema

## 🔧 Configuração Principal

### settings.json

```json
{
  "llm": {
    "provider": "gemini",
    "base_url": "https://generativelanguage.googleapis.com",
    "model": "gemini-3.1-flash-lite-preview",
    "temperature": 0.1,
    "max_tokens": 4096,
    "context_window": 4096,
    "timeout": 600
  },
  "agent": {
    "max_iterations": 30,
    "max_parallel_requests": 1,
    "enable_auto_lint": true,
    "memory_budget": 4294967296
  },
  "sandbox": {
    "timeout": 300,
    "memory_limit": "2g",
    "cpu_limit": "1.0",
    "workspace_base": "/workspace",
    "workspace_mount_path": "/workspace"
  },
  "editor": {
    "default_path": "/workspace",
    "auto_save": true,
    "syntax_highlighting": true
  },
  "ui": {
    "theme": "dark",
    "language": "pt-BR",
    "show_line_numbers": true,
    "word_wrap": true
  }
}
```

### config.json (Configurações Adicionais)

```json
{
  "system": {
    "log_level": "INFO",
    "enable_metrics": true,
    "enable_tracing": false,
    "max_conversation_history": 100
  },
  "tools": {
    "enabled": [
      "bash",
      "python",
      "file_operations",
      "git_operations",
      "docker_operations",
      "web_search"
    ],
    "disabled": [],
    "custom": {
      "csharp_analyzer": {
        "path": "/usr/local/bin/csharp-analyzer",
        "enabled": true
      }
    }
  },
  "security": {
    "allow_network_access": true,
    "allow_file_system_access": true,
    "restricted_paths": [
      "/etc",
      "/root",
      "/sys"
    ],
    "max_file_size": "100MB"
  },
  "performance": {
    "cache_responses": true,
    "cache_ttl": 3600,
    "enable_streaming": true,
    "batch_size": 8
  }
}
```

## 🤖 Funcionalidades Principais

### 1. Agente Autônomo

OpenHands funciona como um agente autônomo capaz de:

- **Executar código** em múltiplas linguagens
- **Manipular arquivos** e sistema de arquivos
- **Usar ferramentas** externas via API
- **Acessar internet** para pesquisa
- **Aprender** com o contexto da conversa

### 2. Sandbox Seguro

O ambiente sandbox garante:

- **Isolamento**: Operações confinadas ao workspace
- **Segurança**: Acesso controlado ao sistema
- **Recursos**: Limites de CPU e memória
- **Persistência**: Estado mantido entre sessões

### 3. Interface Web

Acessível via http://localhost:3000 com:

- **Chat Interface**: Interação natural com o agente
- **Code Editor**: Editor de código com syntax highlighting
- **File Explorer**: Navegação e gerenciamento de arquivos
- **Terminal**: Acesso direto ao sandbox
- **Settings**: Configurações personalizáveis

## 🚀 Casos de Uso

### 1. Desenvolvimento C#/.NET

```bash
# Acesse http://localhost:3000
# Use prompts como:

"Create a new Web API project with Entity Framework Core"
"Implement a repository pattern for this DbContext"
"Generate xUnit tests for this service class"
"Refactor this method using SOLID principles"
"Add authentication to this API endpoint"
```

### 2. Análise de Código

```bash
# Analisar projeto existente
"Analyze this C# project and suggest improvements"
"Check for security vulnerabilities in this code"
"Generate documentation for this API"
"Create architecture diagrams for this system"
```

### 3. Automação

```bash
# Criar scripts e automações
"Create a PowerShell script to deploy this application"
"Generate a Dockerfile for this .NET project"
"Create CI/CD pipeline configuration for GitHub Actions"
"Set up automated testing for this project"
```

## 📊 Monitoramento e Logs

### Estrutura de Logs

```
logs/
├── app.log              # Logs gerais da aplicação
├── agent.log            # Logs específicos do agente
├── error.log            # Logs de erros e exceções
├── access.log           # Logs de acesso à API
├── performance.log      # Logs de performance
└── security.log         # Logs de eventos de segurança
```

### Scripts de Monitoramento

```bash
#!/bin/bash
# monitor-openhands.sh

echo "🤖 Monitoramento do OpenHands"

# Verificar se está rodando
if docker ps | grep -q openhands-hands-app; then
    echo "✅ Container rodando"
else
    echo "❌ Container parado"
    exit 1
fi

# Verificar uso de recursos
echo "📈 Recursos:"
docker stats --no-stream openhands-hands-app

# Verificar logs recentes
echo "📋 Logs recentes:"
docker logs --tail=10 openhands-hands-app

# Verificar erros
echo "🚨 Erros recentes:"
docker logs openhands-hands-app 2>&1 | grep -i error | tail -5

# Verificar conversas ativas
echo "💬 Conversas ativas:"
docker exec openhands-hands-app ls /openhands/data/conversations/ 2>/dev/null | wc -l
```

## 🔧 Administração e Manutenção

### Backup Automático

```bash
#!/bin/bash
# backup-openhands.sh

BACKUP_DIR="backups/openhands"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "🗄️ Backup do OpenHands"

# Criar diretório de backup
mkdir -p $BACKUP_DIR

# Backup das configurações
cp openhands/settings.json $BACKUP_DIR/settings-$TIMESTAMP.json
cp openhands/config.json $BACKUP_DIR/config-$TIMESTAMP.json

# Backup das conversas
if [ -d "openhands/data/conversations" ]; then
    tar -czf $BACKUP_DIR/conversations-$TIMESTAMP.tar.gz openhands/data/conversations/
fi

# Backup dos workspaces
if [ -d "openhands/data/workspaces" ]; then
    tar -czf $BACKUP_DIR/workspaces-$TIMESTAMP.tar.gz openhands/data/workspaces/
fi

# Limpar backups antigos (manter últimos 7)
ls -t $BACKUP_DIR/settings-*.json | tail -n +8 | xargs rm -f
ls -t $BACKUP_DIR/conversations-*.tar.gz | tail -n +8 | xargs rm -f
ls -t $BACKUP_DIR/workspaces-*.tar.gz | tail -n +8 | xargs rm -f

echo "✅ Backup concluído"
```

### Limpeza e Manutenção

```bash
#!/bin/bash
# cleanup-openhands.sh

echo "🧹 Limpeza do OpenHands"

# Limpar logs antigos
find openhands/logs -name "*.log" -mtime +7 -delete

# Limpar cache antigo
find openhands/data/cache -name "*" -mtime +1 -delete

# Limpar conversas muito antigas (30 dias)
find openhands/data/conversations -name "*" -mtime +30 -delete

# Limpar workspaces inativos (7 dias)
find openhands/data/workspaces -name "*" -mtime +7 -delete

# Compactar logs grandes
find openhands/logs -name "*.log" -size +10M -exec gzip {} \;

echo "✅ Limpeza concluída"
```

## 🔧 Configuração Avançada

### Personalização de Modelos

```json
{
  "llm": {
    "provider": "gemini",
    "models": {
      "coding": {
        "model": "gemini-3.1-flash-lite-preview",
        "temperature": 0.1,
        "max_tokens": 4096
      },
      "analysis": {
        "model": "gemini-3.1-flash-lite-preview",
        "temperature": 0.2,
        "max_tokens": 8192
      },
      "creative": {
        "model": "gemini-3.1-flash-lite-preview",
        "temperature": 0.7,
        "max_tokens": 2048
      }
    }
  }
}
```

### Plugins Personalizados

```javascript
// openhands/plugins/custom-tools/csharp-analyzer.js
class CSharpAnalyzer {
    constructor() {
        this.name = 'csharp-analyzer';
        this.description = 'Analyze C# code for best practices';
    }

    async execute(code) {
        // Lógica de análise
        return {
            issues: [],
            suggestions: [],
            metrics: {}
        };
    }
}

module.exports = CSharpAnalyzer;
```

## 🔐 Segurança

### Configurações de Segurança

```json
{
  "security": {
    "allow_network_access": true,
    "allowed_domains": [
      "api.github.com",
      "docs.microsoft.com",
      "stackoverflow.com"
    ],
    "blocked_domains": [
      "malicious-site.com"
    ],
    "max_file_size": "100MB",
    "allowed_file_types": [
      ".cs", ".json", ".xml", ".md", ".txt", ".yml", ".yaml"
    ],
    "scan_uploads": true,
    "rate_limiting": {
      "requests_per_minute": 60,
      "burst_size": 10
    }
  }
}
```

### Boas Práticas de Segurança

1. **Isolamento de Rede**: Limitar acesso a domínios específicos
2. **Validação de Upload**: Escanear arquivos enviados
3. **Rate Limiting**: Limitar requisições por usuário
4. **Audit Logging**: Registrar todas as ações importantes
5. **Regular Updates**: Manter imagem atualizada

## 📈 Performance e Otimização

### Métricas Importantes

- **Tempo de Resposta**: < 2 segundos para prompts simples
- **Throughput**: > 10 requests por minuto
- **Uso de Memória**: < 4GB para operações normais
- **Taxa de Erros**: < 1% para operações padrão

### Otimizações

```json
{
  "performance": {
    "cache_responses": true,
    "cache_ttl": 3600,
    "enable_streaming": true,
    "batch_size": 8,
    "parallel_processing": false,
    "preload_models": true,
    "optimize_for": "speed"
  }
}
```

## 🛠️ Troubleshooting

### Problemas Comuns

1. **Container não inicia**
   ```bash
   # Verificar logs
   docker logs openhands-hands-app
   
   # Verificar configurações
   cat openhands/settings.json
   
   # Reiniciar container
   docker restart openhands-hands-app
   ```

2. **Conexão com Gemini API falha**
   ```bash
   # Testar conexão
  docker exec openhands-hands-app curl -H "Content-Type: application/json" -d '{"contents":[{"parts":[{"text":"Hello"}]}]}' "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-flash-lite-preview:generateContent?key=YOUR_API_KEY"
   
   # Verificar configuração da API Key
   cat openhands/settings.json | grep api_key
   ```

3. **Performance lenta**
   ```bash
   # Verificar recursos
   docker stats openhands-hands-app
   
   # Ajustar configurações
   # Reduzir max_tokens ou context_window
   # Desabilitar features não essenciais
   ```

4. **Erros de permissão**
   ```bash
   # Verificar permissões do workspace
   ls -la workspace/
   
   # Corrigir permissões
   sudo chown -R $USER:$USER workspace/
   chmod -R 755 workspace/
   ```

## 📚 Integração com Outros Serviços

### Gemini API

- **Endpoint**: `https://generativelanguage.googleapis.com`
- **Modelos**: `gemini-3.1-flash-lite-preview` principal
- **API**: Comunicação via REST API
- **Autenticação**: API Key configurada em settings.json

### Workspace

- **Montagem**: `/workspace` montado do host
- **Persistência**: Arquivos mantidos entre sessões
- **Acesso**: Acesso completo ao sistema de arquivos

### GitHub Copilot

- **Integração**: Agents disponíveis no workspace
- **Configuração**: Skills e rules para .NET development
- **Uso**: Copilot para desenvolvimento rápido, OpenHands para tarefas complexas

## 🔄 Roadmap

### v1.5.0 (Planejado)
- Multi-modelo simultâneo
- Melhorias de performance
- Mais ferramentas integradas
- Interface melhorada

### v2.0.0 (Planejado)
- Suporte a multi-usuário
- Sistema de plugins avançado
- Integração com mais serviços
- Analytics dashboard

## 📝 Notas de Versão

### v1.4.0 (Atual)
- Configuração otimizada para Gemini API
- Suporte a GitHub Copilot Agents
- Melhorias de memória e performance
- Interface em português

### v1.3.0
- Integração com Gemini API
- Sandbox melhorado
- Mais ferramentas disponíveis

---

**Importante**: OpenHands é uma ferramenta poderosa. Use com responsabilidade e implemente as configurações de segurança adequadas para seu ambiente.
