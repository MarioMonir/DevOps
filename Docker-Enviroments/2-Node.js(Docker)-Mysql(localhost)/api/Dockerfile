# Node.js version 18.x
FROM node:18 as builder

# Create app directory
WORKDIR /usr/src/app

# Copy package.json , yarn.lock & tsconfig.json
COPY package.json yarn.lock tsconfig.json ./

# Install app dependencies by yarn  
RUN yarn 

# Bundle app source
COPY . .

# Build App
RUN yarn build

# Generate Prisma Database 
RUN npx prisma generate

# Migrate Database 
RUN yarn migrate-database

# Seed Database
RUN yarn seed-database

# Launch the app 
CMD ["yarn", "serve"]


