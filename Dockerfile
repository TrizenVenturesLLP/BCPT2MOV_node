FROM node:18-alpine

WORKDIR /app

# Copy minimal files required to run Hardhat node
COPY package*.json hardhat.config.cjs ./

# Use --legacy-peer-deps to tolerate Hardhat peerDependency matrix
RUN npm ci --only=production --legacy-peer-deps

EXPOSE 8545

# Bind to 0.0.0.0 so it is reachable from outside the container
CMD ["npx", "hardhat", "node", "--hostname", "0.0.0.0", "--port", "8545"]

