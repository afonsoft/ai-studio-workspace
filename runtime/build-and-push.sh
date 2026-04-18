#!/bin/bash

# Build and push custom OpenHands runtime image

echo "Building custom OpenHands runtime image with .NET SDK 10..."

# Build the Docker image
docker build -t ai-studio-workspace:latest ./runtime

# Tag for registry (optional)
# docker tag ai-studio-workspace:latest your-registry/ai-studio-workspace:latest

echo "Build completed!"
echo ""
echo "To use this image with OpenHands:"
echo "1. The docker-compose files are already configured with SANDBOX_RUNTIME_CONTAINER_IMAGE"
echo "2. Run: docker-compose up -d"
echo "3. Or run: docker-compose -f docker-compose.low-resource.yml up -d"
echo ""
echo "To push to registry (optional):"
echo "docker push your-registry/ai-studio-workspace:latest"
