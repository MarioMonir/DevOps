# Install Node 16.15 on linux alpine 3.14 image
FROM node:16.15-alpine3.14

# Create app directory
WORKDIR /app

# copy package.json , yarn.lock and  package-lock.json if not yar.lock
COPY package*.json  yarn.lock  ./

# Install node modules app dependencies
RUN yarn

# Copy the source files into the image
COPY . .

# expost port 3020
EXPOSE 3020

# run the server in development mode
CMD yarn dev
