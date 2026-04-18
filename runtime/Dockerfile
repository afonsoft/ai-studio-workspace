# Multi-stage optimized build for OpenHands custom sandbox
# Stage 1: Build stage with all tools
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS builder

# Set environment variables
ENV NODE_VERSION=22
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV DEBIAN_FRONTEND=noninteractive

# Install essential build dependencies in single layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Install Python 3.12 from official repository (faster than compiling)
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y --no-install-recommends \
    python3.12 \
    python3.12-dev \
    python3.12-venv \
    python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Create symlinks for python/pip
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1 && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.12 1 && \
    update-alternatives --install /usr/bin/pip3 pip3 /usr/bin/pip3 1

# Install Node.js 22 from official NodeSource repository (faster than NVM)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Verify installations
RUN dotnet --version && \
    python3 --version && \
    pip3 --version && \
    node --version && \
    npm --version

# Stage 2: Final minimal image
FROM mcr.microsoft.com/dotnet/sdk:10.0

# Copy installed tools from builder stage
COPY --from=builder /usr/bin/python3* /usr/bin/
COPY --from=builder /usr/bin/node /usr/bin/
COPY --from=builder /usr/bin/npm /usr/bin/
COPY --from=builder /usr/bin/npx /usr/bin/
COPY --from=builder /usr/local/lib/python3.12 /usr/local/lib/python3.12
COPY --from=builder /usr/local/bin/pip3 /usr/local/bin/

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV DEBIAN_FRONTEND=noninteractive

# Install runtime dependencies only
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Create workspace directory
RUN mkdir -p /workspace && chmod 777 /workspace

# Set working directory
WORKDIR /workspace

# Verify installations in final image
RUN dotnet --version && \
    python3 --version && \
    pip3 --version && \
    node --version && \
    npm --version

# Default command
CMD ["/bin/bash"]
