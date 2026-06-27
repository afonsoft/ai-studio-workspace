# 🚀 Configuração e Uso do OmniRoute como Proxy Gateway de LLM

## 📋 Visão Geral

O OmniRoute atua como um proxy gateway para modelos de linguagem, permitindo roteamento inteligente entre diferentes provedores de LLM e modelos específicos. Esta documentação explica como configurar e ajustar o OmniRoute para uso com o OpenHands.

## 🔧 Configuração Básica

### 1. Instalação

Adicione o OmniRoute como um serviço no seu `docker-compose.yml`:

```yaml
services:
  omniroute:
    image: omnigateway/omniroute:latest
    container_name: omnigateway
    ports:
      - "8080:8080"
    environment:
      - OPENAI_API_KEY=${OPENAI_API_KEY}
      - ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}
      - GEMINI_API_KEY=${GEMINI_API_KEY}
    volumes:
      - ./omniroute-config:/config
    networks:
      - openhands-net
```

### 2. Configuração do OmniRoute

Crie um arquivo `omniroute-config/config.json` com a seguinte estrutura:

```json
{
  "providers": {
    "openai": {
      "api_key": "${OPENAI_API_KEY}",
      "base_url": "https://api.openai.com/v1",
      "models": [
        "gpt-4o",
        "gpt-4-turbo"
      ]
    },
    "anthropic": {
      "api_key": "${ANTHROPIC_API_KEY}",
      "base_url": "https://api.anthropic.com/v1",
      "models": [
        "claude-3-opus",
        "claude-3-sonnet"
      ]
    },
    "gemini": {
      "api_key": "${GEMINI_API_KEY}",
      "base_url": "https://generativelanguage.googleapis.com/v1beta",
      "models": [
        "gemini-3.1-flash-lite-preview",
        "gemini-3.1-pro"
      ]
    }
  },
  "default_provider": "gemini",
  "default_model": "gemini-3.1-flash-lite-preview",
  "fallback_strategy": "round_robin"
}
```

## 🔄 Configuração do OpenHands para usar OmniRoute

Atualize o `settings.json` do OpenHands para apontar para o OmniRoute:

```json
{
  "llm_model": "omniroute/gemini-3.1-flash-lite-preview",
  "llm_api_key": "",
  "llm_base_url": "http://omniroute:8080/v1",
  "llm_provider": "omniroute"
}
```

## 🔧 Ajustes Avançados

### 1. Roteamento Inteligente

Configure políticas de roteamento no `config.json` do OmniRoute:

```json
"routing_policies": {
  "cost_optimized": {
    "providers": [
      "gemini",
      "anthropic",
      "openai"
    ],
    "priority": [
      "gemini",
      "anthropic",
      "openai"
    ]
  },
  "performance_optimized": {
    "providers": [
      "openai",
      "gemini",
      "anthropic"
    ],
    "priority": [
      "openai",
      "gemini",
      "anthropic"
    ]
  }
}
```

### 2. Cache de Respostas

Ative o cache no OmniRoute para melhorar a performance:

```json
"cache": {
  "enabled": true,
  "ttl": 3600,
  "max_size": 1000
}
```

### 3. Limites de Requisição

Configure limites de requisição para evitar excesso:

```json
"rate_limits": {
  "global": {
    "requests_per_minute": 1000,
    "burst_size": 100
  },
  "per_provider": {
    "openai": {
      "requests_per_minute": 500
    },
    "anthropic": {
      "requests_per_minute": 500
    },
    "gemini": {
      "requests_per_minute": 500
    }
  }
}
```

## 🔄 Monitoramento e Logs

### 1. Verificar Logs do OmniRoute

```bash
docker logs omnigateway
```

### 2. Verificar Métricas

Acesse o endpoint de métricas do OmniRoute:

```bash
curl http://localhost:8080/metrics
```

## 🔧 Troubleshooting

### Problemas Comuns

1. **Conexão falha com provedor**
   - Verifique as chaves API no `config.json` do OmniRoute
   - Teste a conexão manualmente com `curl`

2. **Roteamento incorreto**
   - Verifique as políticas de roteamento no `config.json`
   - Confirme se o modelo padrão está configurado corretamente

3. **Performance lenta**
   - Verifique as métricas do OmniRoute
   - Ajuste os limites de requisição conforme necessário

## 📚 Referências

- [Documentação Oficial do OmniRoute](https://docs.omnigateway.com)
- [API Reference](https://api.omnigateway.com/docs)
- [GitHub do OmniRoute](https://github.com/omnigateway/omniroute)

---

**Nota**: Esta documentação está em desenvolvimento. Consulte a documentação oficial para as últimas atualizações e melhores práticas.