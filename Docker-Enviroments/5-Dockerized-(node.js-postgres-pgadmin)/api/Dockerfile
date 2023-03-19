# Node.js latest alpine
FROM node:lts

# Create app directory
WORKDIR /usr/src/app

# Copy package.json, yarn.lock & tsconfig.json
COPY package.json yarn.lock tsconfig.json ./

# Install app dependencies by yarn  
RUN yarn

# Copy Files 
COPY . .

# Set .env file `if not existed` from .example.env
RUN cp -n .env.example .env

# Generate Prisma Client
RUN npx prisma generate 

# Build App
RUN yarn build:docker

# Launch the app 
CMD ["yarn", "deploy:docker"]
