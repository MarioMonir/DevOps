# Node.js version 18.x 
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package.json , yarn.lock & tsconfig.json
COPY package.json yarn.lock tsconfig.json ./

# Install app dependencies by yarn  
RUN yarn

# Copy Files 
COPY . .

# Build App
RUN yarn build

# Launch the app 
CMD ["yarn", "deploy"]

