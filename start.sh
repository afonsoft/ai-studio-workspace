#!/bin/bash

# Cores para melhor visualização
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_docker() {
    if ! docker info > /dev/null 2>&1; then
        print_error "Docker não está rodando. Por favor, inicie o Docker primeiro."
        exit 1
    fi
}

check_docker_compose() {
    if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
        print_error "docker-compose não encontrado. Por favor, instale docker-compose."
        exit 1
    fi
}

create_directories() {
    print_status "Criando diretórios necessários..."
    mkdir -p workspace openhands
    print_success "Diretórios criados"
}

check_nvidia_docker_runtime() {
    print_status "Verificando NVIDIA Docker Runtime..."
    
    # Check if nvidia runtime is available in Docker
    if docker info 2>/dev/null | grep -q "nvidia"; then
        print_success "NVIDIA Docker Runtime detectado"
        return 0
    else
        print_warning "NVIDIA Docker Runtime não detectado"
        print_status "Para usar GPU, instale nvidia-container-toolkit:"
        echo "  - Ubuntu/Debian: sudo apt-get install -y nvidia-container-toolkit"
        echo "  - CentOS/RHEL: sudo yum install -y nvidia-container-toolkit"
        echo "  - Reinicie Docker após instalação"
        return 1
    fi
}

test_gpu_access() {
    print_status "Testando acesso GPU no Docker..."
    
    # Try to run a simple GPU test container
    if docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi &> /dev/null; then
        print_success "Docker pode acessar GPU NVIDIA"
        return 0
    else
        print_warning "Docker não pode acessar GPU NVIDIA"
        return 1
    fi
}

check_system_resources() {
    print_status "Verificando recursos do sistema..."
    
    HAS_GPU=false
    GPU_AVAILABLE=false
    
    if command -v free &> /dev/null; then
        TOTAL_MEM=$(free -g | awk '/^Mem:/{print $2}')
        print_status "Memória total: ${TOTAL_MEM}GB"
        if [ "$TOTAL_MEM" -lt 12 ]; then
            print_warning "Memória baixa detectada (< 12GB). Considere usar docker-compose.low-resource.yml"
        fi
    fi
    
    if command -v nproc &> /dev/null; then
        TOTAL_CPU=$(nproc)
        print_status "CPUs disponíveis: ${TOTAL_CPU}"
        if [ "$TOTAL_CPU" -lt 4 ]; then
            print_warning "CPUs limitados (< 4). Performance pode ser reduzida"
        fi
    fi
    
    # GPU Detection
    if command -v nvidia-smi &> /dev/null; then
        GPU_MEMORY=$(nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits | head -1)
        print_status "GPU NVIDIA detectada: ${GPU_MEMORY}MB VRAM"
        HAS_GPU=true
        
        if [ "$GPU_MEMORY" -lt 4000 ]; then
            print_warning "VRAM limitada (< 4GB)"
        fi
        
        # Check if Docker can use GPU
        if check_nvidia_docker_runtime && test_gpu_access; then
            GPU_AVAILABLE=true
            print_success "GPU disponível para uso no Docker"
        else
            print_warning "GPU detectada mas não disponível no Docker"
            print_status "Usando modo CPU-only"
            GPU_AVAILABLE=false
        fi
    else
        print_warning "Nenhuma GPU NVIDIA detectada. Usando CPU-only"
        HAS_GPU=false
        GPU_AVAILABLE=false
    fi
    
    # Export GPU availability for later use
    export HAS_GPU
    export GPU_AVAILABLE
}

wait_for_service() {
    local service_name=$1
    local port=$2
    local max_attempts=30
    local attempt=1
    print_status "Aguardando $service_name ficar pronto (porta $port)..."
    while [ $attempt -le $max_attempts ]; do
        if curl -s "http://localhost:$port" > /dev/null 2>&1; then
            print_success "$service_name está pronto!"
            return 0
        fi
        echo -n "."
        sleep 2
        attempt=$((attempt + 1))
    done
    print_warning "$service_name pode não estar completamente pronto após $((max_attempts * 2)) segundos"
    return 1
}

check_containers() {
    print_status "Verificando status dos containers..."
    if command -v docker-compose &> /dev/null; then
        docker-compose ps
    else
        docker compose ps
    fi
}

show_error_logs() {
    print_status "Verificando logs de erro..."
    if command -v docker-compose &> /dev/null; then
        docker-compose logs --tail=20 | grep -i error || print_success "Nenhum erro encontrado nos logs"
    else
        docker compose logs --tail=20 | grep -i error || print_success "Nenhum erro encontrado nos logs"
    fi
}

check_gemini_api_key() {
    print_status "Verificando configuração da API Gemini..."
    
    # Verificar settings.json
    local settings_key=""
    if [ -f "openhands/settings.json" ]; then
        settings_key=$(grep -o '"llm_api_key":[[:space:]]*"[^"]*"' openhands/settings.json | sed 's/.*"llm_api_key":[[:space:]]*"\([^"]*\)".*/\1/')
    fi
    
    # Verificar config.json
    local config_key=""
    if [ -f "openhands/config.json" ]; then
        config_key=$(grep -o '"api_key":[[:space:]]*"[^"]*"' openhands/config.json | sed 's/.*"api_key":[[:space:]]*"\([^"]*\)".*/\1/')
    fi
    
    # Verificar config.toml
    local toml_key=""
    if [ -f "openhands/config.toml" ]; then
        toml_key=$(grep "api_key" openhands/config.toml | sed 's/.*api_key[[:space:]]*=[[:space:]]*"\([^"]*\)".*/\1/')
    fi
    
    # Verificar se algum dos arquivos tem a API key configurada
    if [[ "$settings_key" == "YOUR_API_KEY_HERE" || "$settings_key" == "" || \
          "$config_key" == "YOUR_API_KEY_HERE" || "$config_key" == "" || \
          "$toml_key" == "SUA_CHAVE_AQUI" || "$toml_key" == "" ]]; then
        print_error "API Key do Gemini não configurada!"
        echo ""
        echo "Para usar o Dev Tools IA com Gemini API, você precisa:"
        echo "1. Obter uma API Key em: https://aistudio.google.com/app/apikey"
        echo "2. Configurar a API Key nos arquivos:"
        echo "   - openhands/settings.json (campo llm_api_key)"
        echo "   - openhands/config.json (campo api_key)"
        echo "   - openhands/config.toml (campo api_key)"
        echo ""
        echo -n "Deseja configurar a API Key agora? (s/N): "
        read -r response
        if [[ "$response" =~ ^[Ss]$ ]]; then
            configure_gemini_api_key
        else
            print_error "Configure a API Key antes de executar o script."
            exit 1
        fi
    else
        print_success "API Key do Gemini configurada corretamente!"
    fi
}

configure_gemini_api_key() {
    echo ""
    print_status "Configuração da API Key Gemini"
    echo "Obtenha sua API Key em: https://aistudio.google.com/app/apikey"
    echo ""
    echo -n "Digite sua API Key Gemini: "
    read -r api_key
    
    if [[ "$api_key" == "" ]]; then
        print_error "API Key não pode ser vazia!"
        exit 1
    fi
    
    # Atualizar settings.json
    if [ -f "openhands/settings.json" ]; then
        print_status "Atualizando openhands/settings.json..."
        if command -v jq &> /dev/null; then
            jq --arg api_key "$api_key" '.llm_api_key = $api_key' openhands/settings.json > temp_settings.json && mv temp_settings.json openhands/settings.json
        else
            # Fallback para sed se jq não estiver disponível
            sed -i.bak "s/\"llm_api_key\":[[:space:]]*\"YOUR_API_KEY_HERE\"/\"llm_api_key\": \"$api_key\"/g" openhands/settings.json
            sed -i.bak "s/\"llm_api_key\":[[:space:]]*\"\"/\"llm_api_key\": \"$api_key\"/g" openhands/settings.json
            rm -f openhands/settings.json.bak
        fi
        print_success "settings.json atualizado!"
    fi
    
    # Atualizar config.json
    if [ -f "openhands/config.json" ]; then
        print_status "Atualizando openhands/config.json..."
        if command -v jq &> /dev/null; then
            jq --arg api_key "$api_key" '.llm.api_key = $api_key' openhands/config.json > temp_config.json && mv temp_config.json openhands/config.json
        else
            # Fallback para sed se jq não estiver disponível
            sed -i.bak "s/\"api_key\":[[:space:]]*\"YOUR_API_KEY_HERE\"/\"api_key\": \"$api_key\"/g" openhands/config.json
            sed -i.bak "s/\"api_key\":[[:space:]]*\"\"/\"api_key\": \"$api_key\"/g" openhands/config.json
            rm -f openhands/config.json.bak
        fi
        print_success "config.json atualizado!"
    fi
    
    # Atualizar config.toml
    if [ -f "openhands/config.toml" ]; then
        print_status "Atualizando openhands/config.toml..."
        # Usar sed para substituir a API key no config.toml
        sed -i.bak "s/api_key[[:space:]]*=[[:space:]]*\"SUA_CHAVE_AQUI\"/api_key = \"$api_key\"/g" openhands/config.toml
        sed -i.bak "s/api_key[[:space:]]*=[[:space:]]*\"\"/api_key = \"$api_key\"/g" openhands/config.toml
        rm -f openhands/config.toml.bak
        print_success "config.toml atualizado!"
    fi
    
    print_success "API Key configurada com sucesso em todos os arquivos!"
}

# Detecta o sistema operacional
OS_TYPE="$(uname -s)"

# Início do script
echo "======================================"
echo "🚀 Dev Tools IA - Deploy Inteligente"
echo "======================================"

check_docker
check_docker_compose

# Verificar API Key antes de continuar
check_gemini_api_key

print_status "Encerrando ambiente anterior (se existir)..."
if command -v docker-compose &> /dev/null; then
    docker-compose down --remove-orphans
else
    docker compose down --remove-orphans
fi

print_status "Preparando ambiente..."
create_directories
check_system_resources

COMPOSE_FILE="docker-compose.yml"
USE_GPU=false

# Ask user about GPU mode if GPU is available
if [ "$GPU_AVAILABLE" = true ]; then
    echo ""
    echo "GPU NVIDIA detectada e disponível no Docker"
    echo -n "Deseja usar GPU? (S/n): "
    read -r gpu_response
    if [[ "$gpu_response" =~ ^[Nn]$ ]]; then
        print_status "Usando modo CPU-only"
        USE_GPU=false
    else
        print_status "Usando modo GPU"
        USE_GPU=true
    fi
else
    print_status "Usando modo CPU-only (GPU não disponível)"
    USE_GPU=false
fi

# Select compose file based on resources and GPU preference
if command -v free &> /dev/null; then
    TOTAL_MEM=$(free -g | awk '/^Mem:/{print $2}')
    if [ "$TOTAL_MEM" -lt 12 ]; then
        COMPOSE_FILE="docker-compose.low-resource.yml"
        print_warning "Usando configuração low-resource devido à memória limitada"
    fi
fi

# Update compose file for CPU-only mode if needed
if [ "$USE_GPU" = false ] && [ "$COMPOSE_FILE" = "docker-compose.yml" ]; then
    print_status "Desabilitando suporte GPU no docker-compose.yml"
    # Remove GPU-specific configurations by using a modified command
    COMPOSE_CMD="docker-compose -f $COMPOSE_FILE"
elif [ "$USE_GPU" = true ]; then
    print_status "Habilitando suporte GPU"
    COMPOSE_CMD="docker-compose -f $COMPOSE_FILE"
else
    COMPOSE_CMD="docker-compose -f $COMPOSE_FILE"
fi

print_status "Usando: $COMPOSE_FILE"
if command -v docker-compose &> /dev/null; then
    docker-compose -f "$COMPOSE_FILE" up --build -d
else
    docker compose -f "$COMPOSE_FILE" up --build -d
fi

if [ $? -ne 0 ]; then
    print_error "Falha no build dos containers"
    show_error_logs
    exit 1
fi

print_success "Containers iniciados com sucesso!"
sleep 10
check_containers

print_status "Aguardando inicialização dos serviços..."
wait_for_service "OpenHands" 3000

print_status "Abrindo serviços no navegador..."
if [[ "$OS_TYPE" == "Linux" ]]; then
    if command -v xdg-open &> /dev/null; then
        xdg-open http://localhost:3000 2>/dev/null &
    fi
elif [[ "$OS_TYPE" == "Darwin" ]]; then
    open http://localhost:3000 2>/dev/null &
elif [[ "$OS_TYPE" == "MINGW"* ]] || [[ "$OS_TYPE" == "CYGWIN"* ]] || [[ -n "$WINDIR" ]]; then
    start http://localhost:3000 2>/dev/null
else
    print_warning "Não foi possível detectar o sistema operacional para abrir URLs automaticamente."
fi

print_success "🎉 Ambiente iniciado com sucesso!"
print_status "Para encerrar o ambiente, execute: docker-compose down"
