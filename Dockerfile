FROM node:22-alpine

WORKDIR /app

# Copy minimal files required to run Hardhat node
COPY package*.json hardhat.config.cjs ./

# Verify files were copied (for debugging)
RUN ls -la

# Install all dependencies (including dev) so Hardhat is available
# Use --legacy-peer-deps to tolerate Hardhat peerDependency matrix
RUN npm ci --legacy-peer-deps

EXPOSE 8545

# Bind to 0.0.0.0 so it is reachable from outside the container
CMD ["npx", "hardhat", "node", "--hostname", "0.0.0.0", "--port", "8545"]

