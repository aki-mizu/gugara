# Base stage: Use Nix to set up the development environment
FROM nixos/nix:latest AS base

# Set the working directory
WORKDIR /app

# Copy the flake.nix file into the container
COPY flake.nix .

# Copy package.json and pnpm-lock.yaml into the container
COPY package.json pnpm-lock.yaml ./

# Install the dependencies defined in the flake.nix file and run pnpm install within the nix develop environment
RUN nix develop --impure --extra-experimental-features nix-command --extra-experimental-features flakes --command pnpm install --frozen-lockfile

# Copy the rest of your project files into the container
COPY . .

# Runtime stage: Use a lightweight Node.js image
FROM node:20-alpine AS runtime

# Set the working directory
WORKDIR /app

# Install pnpm in the runtime stage
RUN npm install -g pnpm

# Copy only the necessary files from the base stage
COPY --from=base /app /app