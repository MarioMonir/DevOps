# Use alpine Node.js image as the base image
FROM node:18-alpine3.16

# Set the working directory
WORKDIR /app

# Install pnpm on alpine linux 
RUN wget -qO /bin/pnpm "https://github.com/pnpm/pnpm/releases/latest/download/pnpm-linuxstatic-x64" && chmod +x /bin/pnpm

# Copy the package.json and package-lock.json files
COPY package.json pnpm-lock.yaml ./

# Install the dependencies
RUN pnpm i

# Copy the rest of the app's files
COPY . .

# Build the app
RUN pnpm build

# Expose the app's port
EXPOSE 3000

# Start the app
CMD ["pnpm", "start"]