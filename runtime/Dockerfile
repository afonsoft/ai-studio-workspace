# Custom sandbox image based on OpenHands agent-server
# Base image: nikolaik/python-nodejs (same as ghcr.io/openhands/agent-server)
# Extended with .NET SDK 10 for C# development support
FROM nikolaik/python-nodejs:python3.12-nodejs22

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV DEBIAN_FRONTEND=noninteractive

# Install .NET SDK 10
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" > /etc/apt/sources.list.d/microsoft.list \
    && apt-get update && apt-get install -y --no-install-recommends \
    dotnet-sdk-10.0 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Install additional tools commonly used in agent-server
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    sudo \
    wget \
    vim \
    nano \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Install Python packages for data processing
RUN pip3 install --no-cache-dir numpy pandas

# Create workspace directory
RUN mkdir -p /workspace && chmod 777 /workspace

# Set working directory
WORKDIR /workspace

# Verify installations
RUN dotnet --version && \
    python3 --version && \
    pip3 --version && \
    node --version && \
    npm --version

# Default command
CMD ["/bin/bash"]
