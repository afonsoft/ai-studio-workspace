# 📁 Workspace - Área de Trabalho Compartilhada

## 📋 Visão Geral

Este diretório serve como área de trabalho compartilhada entre os containers Docker, permitindo troca de arquivos e colaboração entre diferentes serviços do projeto DevTools IA.

## 📁 Estrutura do Diretório

```
workspace/
├── README.md                    # Este arquivo
├── projects/                    # Projetos de desenvolvimento
│   ├── sample-csharp/          # Projeto C# de exemplo
│   │   ├── src/                # Código fonte
│   │   ├── tests/              # Testes unitários
│   │   └── README.md           # Documentação do projeto
│   ├── documentation/          # Documentação técnica
│   └── templates/             # Templates de projeto
├── shared/                     # Arquivos compartilhados
│   ├── configs/               # Configurações compartilhadas
│   ├── scripts/               # Scripts utilitários
│   └── resources/             # Recursos reutilizáveis
├── temp/                       # Arquivos temporários
│   ├── uploads/               # Uploads temporários
│   ├── downloads/             # Downloads temporários
│   └── cache/                 # Cache compartilhado
└── logs/                       # Logs compartilhados
    ├── openhands/             # Logs do OpenHands
    └── webui/                 # Logs do WebUI
```

## 🎯 Propósito

### O que é armazenado aqui:

1. **Projetos de Desenvolvimento**: Código fonte e arquivos de projetos
2. **Arquivos Compartilhados**: Configurações e recursos comuns
3. **Dados Temporários**: Uploads, downloads e cache
4. **Logs Consolidados**: Logs de diferentes serviços em um local
5. **Templates**: Modelos reutilizáveis para novos projetos

### Por que este diretório é importante:

- **Colaboração**: Permite que diferentes serviços acessem os mesmos arquivos
- **Persistência**: Dados sobrevivem a reinicializações de containers
- **Flexibilidade**: Área de trabalho para experimentação e desenvolvimento
- **Organização**: Centraliza arquivos que seriam espalhados por vários lugares

## 🔧 Configuração no Docker Compose

No arquivo `docker-compose.yml`, este diretório é montado como volume em múltiplos serviços:

```yaml
services:
  openhands:
    volumes:
      - ./workspace:/workspace
  
  open-webui:
    volumes:
      - ./workspace:/workspace
```

Isso garante que:
- OpenHands possa acessar e modificar arquivos de projeto
- WebUI possa exibir e gerenciar arquivos compartilhados
- Todos os serviços vejam a mesma estrutura de arquivos

## 🚀 Casos de Uso

### 1. Desenvolvimento C#/.NET

```bash
# Criar novo projeto
mkdir workspace/projects/meu-projeto
cd workspace/projects/meu-projeto

# Inicializar projeto .NET
dotnet new webapi -n MeuProjeto
dotnet new sln -n MeuProjeto
dotnet sln add src/MeuProjeto

# Usar OpenHands para desenvolver
# Acesse http://localhost:3000 e use o workspace
```

### 2. Análise de Código com OpenHands

```bash
# Colocar código para análise
cp /path/to/your/code.cs workspace/projects/analysis/

# Usar OpenHands para análise
# Acesse http://localhost:3000 e peça para analisar o código em /workspace/projects/analysis/
```

### 3. Documentação

```bash
# Criar documentação
mkdir workspace/projects/documentation
echo "# Meu Projeto" > workspace/projects/documentation/README.md

# Usar WebUI para editar documentação
# Acesse http://localhost:8080 e use o editor de arquivos
```

## 📊 Gerenciamento de Arquivos

### Estrutura Recomendada para Projetos:

```
workspace/projects/nome-do-projeto/
├── src/                    # Código fonte
│   ├── Controllers/        # Controllers (API)
│   ├── Models/            # Models e DTOs
│   ├── Services/          # Lógica de negócio
│   ├── Data/              # Acesso a dados
│   └── Configuration/     # Configurações
├── tests/                  # Testes
│   ├── Unit/              # Testes unitários
│   ├── Integration/       # Testes de integração
│   └── E2E/               # Testes E2E
├── docs/                   # Documentação
├── scripts/                # Scripts de build/deploy
├── docker/                 # Arquivos Docker
└── README.md              # Documentação do projeto
```

### Scripts de Organização:

```bash
#!/bin/bash
# organize-workspace.sh

echo "🗂️ Organizando workspace..."

# Criar estrutura básica
mkdir -p workspace/{projects,shared,temp,logs}
mkdir -p workspace/projects/{sample-csharp,documentation,templates}
mkdir -p workspace/shared/{configs,scripts,resources}
mkdir -p workspace/temp/{uploads,downloads,cache}
mkdir -p workspace/logs/{openhands,webui}

# Criar projeto exemplo
if [ ! -d "workspace/projects/sample-csharp" ]; then
    mkdir -p workspace/projects/sample-csharp/{src,tests,docs}
    echo "# Projeto C# de Exemplo" > workspace/projects/sample-csharp/README.md
    echo "Este é um projeto exemplo para demonstrar o uso do workspace." >> workspace/projects/sample-csharp/README.md
fi

# Criar scripts compartilhados
cat > workspace/shared/scripts/clean-workspace.sh << 'EOF'
#!/bin/bash
echo "🧹 Limpando workspace..."

# Remover arquivos temporários antigos
find workspace/temp -name "*" -mtime +7 -delete

# Limpar logs antigos
find workspace/logs -name "*.log" -mtime +30 -delete

echo "✅ Workspace limpo"
EOF

chmod +x workspace/shared/scripts/clean-workspace.sh

echo "✅ Workspace organizado"
```

## 🔍 Monitoramento e Manutenção

### Script de Monitoramento:

```bash
#!/bin/bash
# monitor-workspace.sh

echo "📊 Monitoramento do Workspace"

# Verificar uso de espaço
echo "💾 Uso de espaço:"
du -sh workspace/*
echo ""

# Verificar arquivos grandes
echo "📦 Arquivos grandes (>100MB):"
find workspace -type f -size +100M -exec ls -lh {} \; 2>/dev/null
echo ""

# Verificar estrutura
echo "📁 Estrutura dos projetos:"
find workspace/projects -maxdepth 2 -type d | sort
echo ""

# Verificar permissões
echo "🔐 Verificando permissões:"
find workspace -type f -not -perm -u=w -exec ls -la {} \; 2>/dev/null
echo ""

# Limpeza sugerida
echo "🧹 Sugestão de limpeza:"
echo "  - Arquivos em temp/ com mais de 7 dias: $(find workspace/temp -mtime +7 | wc -l)"
echo "  - Logs com mais de 30 dias: $(find workspace/logs -mtime +30 | wc -l)"
echo "  - Espaço total usado: $(du -sh workspace | cut -f1)"
```

### Backup Automático:

```bash
#!/bin/bash
# backup-workspace.sh

BACKUP_DIR="backups/workspace"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/workspace-backup-$TIMESTAMP.tar.gz"

echo "🗄️ Criando backup do workspace"

# Criar diretório de backup
mkdir -p $BACKUP_DIR

# Excluir arquivos temporários do backup
tar --exclude='workspace/temp/*' \
    --exclude='workspace/logs/*' \
    --exclude='workspace/projects/*/bin/*' \
    --exclude='workspace/projects/*/obj/*' \
    -czf $BACKUP_FILE workspace/

echo "✅ Backup criado: $BACKUP_FILE"

# Limpar backups antigos (manter últimos 5)
ls -t $BACKUP_DIR/workspace-backup-*.tar.gz | tail -n +6 | xargs rm -f
```

## 🛠️ Integração com Serviços

### OpenHands:

OpenHands usa o workspace como diretório de trabalho padrão:

```python
# Configuração no OpenHands
WORKSPACE_BASE = "/workspace"
WORKSPACE_MOUNT_PATH = "/workspace"
```

Isso permite que o OpenHands:
- Crie e modifique arquivos de projeto
- Execute comandos no contexto do projeto
- Tenha acesso a todo o código fonte
- Mantenha o estado entre sessões

### WebUI:

WebUI pode:
- Exibir e editar arquivos do workspace
- Fazer upload de novos arquivos
- Organizar projetos
- Visualizar estrutura de diretórios

## 📚 Templates e Recursos

### Template de Projeto C#:

```bash
# Criar template
mkdir -p workspace/templates/csharp-webapi

cat > workspace/templates/csharp-webapi/.template.config/template.json << 'EOF'
{
  "$schema": "http://json.schemastore.org/template",
  "author": "DevTools IA",
  "classifications": ["Web", "API", "C#"],
  "identity": "DevTools.IA.CSharp.WebAPI",
  "name": "DevTools IA C# Web API",
  "shortName": "dt-webapi",
  "tags": {
    "language": "C#",
    "type": "project"
  },
  "sourceName": "ProjectName",
  "preferNameDirectory": "true"
}
EOF
```

### Scripts Compartilhados:

```bash
# Script de build
cat > workspace/shared/scripts/build.sh << 'EOF'
#!/bin/bash
echo "🔨 Build do projeto..."

cd /workspace/projects/$1

if [ -f "*.sln" ]; then
    dotnet build
else
    echo "❌ Nenhum arquivo .sln encontrado"
    exit 1
fi

echo "✅ Build concluído"
EOF

chmod +x workspace/shared/scripts/build.sh
```

## 🔐 Segurança e Permissões

### Permissões Recomendadas:

```bash
# Dono: usuário que executa o Docker
# Grupo: docker
# Permissões: 755 para diretórios, 644 para arquivos

sudo chown -R $USER:docker workspace/
find workspace -type d -exec chmod 755 {} \;
find workspace -type f -exec chmod 644 {} \;
chmod +x workspace/shared/scripts/*.sh
```

### Considerações de Segurança:

1. **Isolamento**: Cada serviço tem acesso limitado ao necessário
2. **Backup**: Implementar backup regular de projetos importantes
3. **Limpeza**: Remover dados sensíveis do temp/ regularmente
4. **Monitoramento**: Monitorar acesso não autorizado

## 📈 Performance

### Otimizações:

1. **Estrutura Plana**: Evite diretórios muito profundos
2. **Cache Local**: Use workspace/temp/cache para arquivos temporários
3. **Limpeza Regular**: Remova arquivos não utilizados
4. **Compactação**: Use compactação para backups

### Métricas:

- **Tamanho Máximo**: 10GB por projeto
- **Profundidade Máxima**: 5 níveis de diretórios
- **Arquivos por Projeto**: Máximo 10.000 arquivos
- **Tamanho de Arquivo**: Máximo 100MB por arquivo

## 🔄 Best Practices

### Para Desenvolvimento:

1. **Use a estrutura recomendada**: Siga o padrão de organização
2. **Documente seus projetos**: Mantenha README.md atualizados
3. **Versionamento**: Use .gitignore para arquivos temporários
4. **Testes**: Mantenha testes no diretório apropriado

### Para Colaboração:

1. **Compartilhe apenas o necessário**: Não coloque arquivos sensíveis
2. **Use nomes descritivos**: Facilite a identificação de arquivos
3. **Limpe após o uso**: Remova arquivos temporários
4. **Documente o processo**: Mantenha guias de uso atualizados

## 📝 Exemplos Práticos

### Exemplo 1: Criar Projeto Web API

```bash
# Criar estrutura
mkdir -p workspace/projects/minha-api/{src,tests,docs}

# Inicializar projeto
cd workspace/projects/minha-api
dotnet new webapi -n MinhaAPI
dotnet new sln -n MinhaAPI
dotnet sln add src/MinhaAPI

# Usar OpenHands para desenvolver
# Acesse http://localhost:3000 e peça para desenvolver endpoints
```

### Exemplo 2: Análise de Código com OpenHands

```bash
# Copiar código para análise
cp -r /path/to/existing/code workspace/projects/analysis/

# Usar OpenHands para análise
# Acesse http://localhost:3000 e peça para analisar o código em /workspace/projects/analysis/ e sugerir melhorias

# Gerar documentação com OpenHands
# Peça para criar documentação para o código em /workspace/projects/analysis/
```

### Exemplo 3: Template Reutilizável

```bash
# Criar template
cp -r workspace/projects/sample-csharp workspace/templates/my-template

# Personalizar template
# Edite os arquivos em workspace/templates/my-template/

# Usar template para novo projeto
cp -r workspace/templates/my-template workspace/projects/novo-projeto
cd workspace/projects/novo-projeto
# Personalize conforme necessário
```

## 📚 Documentação Adicional

- [Guia do OpenHands](../README.md)
- [WebUI Interface](../openhands/README.md)
- [Docker Compose](../docker-compose.yml)
- [GitHub Copilot Agents](../agents/GEMINI.md)

---

**Importante**: O workspace é uma área compartilhada. Tenha cuidado com arquivos sensíveis e implemente políticas de backup e limpeza regulares.
