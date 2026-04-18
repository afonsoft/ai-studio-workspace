#!/bin/bash

# ╔═══════════════════════════════════════════════════════════════════════╗
# ║  VS Code / Windsurf — Install Extensions Script (Cross-Platform)      ║
# ║  Focado em C#/.NET + Angular Web Development                         ║
# ╚═══════════════════════════════════════════════════════════════════════╝

echo "🚀 VS Code Extensions Installer - C#/.NET + Angular Development"
echo "==============================================================="

# Detectar sistema operacional
detect_os() {
    case "$(uname -s)" in
        Linux*)     OS="Linux";;
        Darwin*)    OS="macOS";;
        CYGWIN*|MINGW*|MSYS*) OS="Windows";;
        *)          OS="Unknown";;
    esac
    echo "📱 Sistema detectado: $OS"
}

# Verificar VS Code/Windsurf instalado
check_vscode() {
    echo "🔍 Verificando VS Code/Windsurf..."
    if command -v code &> /dev/null; then
        echo "✅ VS Code encontrado"
        CODE_CMD="code"
    elif command -v windsurf &> /dev/null; then
        echo "✅ Windsurf encontrado"
        CODE_CMD="windsurf"
    elif command -v code-server &> /dev/null; then
        echo "✅ Code Server encontrado"
        CODE_CMD="code-server"
    elif [[ "$OS" == "Windows" ]] && command -v code.cmd &> /dev/null; then
        echo "✅ VS Code encontrado (Windows)"
        CODE_CMD="code.cmd"
    else
        echo "❌ VS Code/Windsurf não encontrado. Instale VS Code ou Windsurf primeiro."
        exit 1
    fi
}

# Lista de extensões para instalar (focado em C# e Angular)
declare -a EXTENSIONS=(
    # 🚀 AI & Code Completion
    "github.copilot"
    "github.copilot-chat"
    "ms-vscode.intellicode"

    # 💻 C# / .NET Development
    "ms-dotnettools.csharp"
    "ms-dotnettools.csdevkit"
    "ms-dotnettools.blazor"
    "ms-dotnettools.vscode-dotnet-runtime"
    "formulahendry.dotnet-core-snippets"
    "ms-dotnettools.vscode-dotnet-pack"

    # 🧪 Testing & Quality
    "formulahendry.dotnet-test-explorer"

    # 🌐 Web Development (Angular & Frontend)
    "angular.ng-template"
    "johnpapa.angular2"
    "ms-vscode.vscode-html-css-pack"
    "bradlc.vscode-tailwindcss"
    "formulahendry.auto-rename-tag"
    "formulahendry.auto-close-tag"
    "ms-vscode.vscode-typescript-next"
    "ms-vscode.vscode-jest"

    # 📝 Languages & Frameworks
    "ms-vscode.vscode-json"
    "redhat.vscode-xml"
    "redhat.vscode-yaml"

    # 🐳 Docker & Containers
    "ms-azuretools.vscode-docker"

    # 🔧 Git & Version Control
    "eamodio.gitlens"
    "github.vscode-pull-request-github"
    "codezombiech.gitignore"

    # 🗄️ Database & Data
    "ms-mssql.mssql"
    "humao.rest-client"

    # 🎨 Code Quality & Formatting
    "esbenp.prettier-vscode"
    "editorconfig.editorconfig"

    # 📋 Productivity & Utilities
    "christian-kohler.path-intellisense"
    "christian-kohler.npm-intellisense"
    "coenraadf.bracket-pair-colorizer-2"

    # 🖥️ Terminal & Shell
    "ms-vscode.vscode-powershell"

    # 🎨 Themes & Icons
    "pkief.material-icon-theme"
    "vscode-icons-team.vscode-icons"

    # 📖 Documentation & Markdown
    "yzhang.markdown-all-in-one"

    # 🔍 Search & Navigation
    "redhat.vscode-commons"
)

# Instalar extensões
install_extensions() {
    echo "📦 Instalando ${#EXTENSIONS[@]} extensões..."
    echo ""
    
    local success_count=0
    local fail_count=0
    
    for extension in "${EXTENSIONS[@]}"; do
        echo -n "🔧 Instalando $extension... "
        
        if $CODE_CMD --install-extension "$extension" --force &> /dev/null; then
            echo "✅"
            ((success_count++))
        else
            echo "❌"
            ((fail_count++))
        fi
    done
    
    echo ""
    echo "📊 Resumo da instalação:"
    echo "✅ Sucesso: $success_count extensões"
    echo "❌ Falhas: $fail_count extensões"
}

# Verificar instalações
verify_installations() {
    echo ""
    echo "🔍 Verificando extensões instaladas..."
    
    local installed_count=0
    for extension in "${EXTENSIONS[@]}"; do
        if $CODE_CMD --list-extensions | grep -q "$extension"; then
            ((installed_count++))
        fi
    done
    
    echo "📈 Extensões instaladas: $installed_count/${#EXTENSIONS[@]}"
    
    if [[ $installed_count -eq ${#EXTENSIONS[@]} ]]; then
        echo "🎉 Todas as extensões foram instaladas com sucesso!"
    else
        echo "⚠️  Algumas extensões podem não ter sido instaladas. Verifique manualmente."
    fi
}

# Exibir informações úteis
show_info() {
    echo ""
    echo "📋 Informações úteis:"
    echo "• Para listar extensões instaladas: $CODE_CMD --list-extensions"
    echo "• Para desinstalar extensão: $CODE_CMD --uninstall-extension <nome>"
    echo "• Para atualizar extensões: $CODE_CMD --update-extensions"
    echo ""
    echo "⚡ Extensões principais instaladas:"
    echo "• GitHub Copilot (AI code completion)"
    echo "• C# Dev Kit (.NET development)"
    echo "• Angular Extension (Frontend framework)"
    echo "• Docker (Container development)"
    echo "• GitLens (Git superpowers)"
    echo "• Material Icon Theme (Modern icons)"
    echo ""
    echo "🚀 VS Code/Windsurf está pronto para desenvolvimento C#/.NET + Angular!"
}

# Função principal
main() {
    detect_os
    check_vscode
    install_extensions
    verify_installations
    show_info
}

# Executar script
main "$@"
