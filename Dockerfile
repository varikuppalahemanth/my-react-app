# Use an official Node.js runtime as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the React app
RUN npm run build

# Expose the port the app will run on
EXPOSE 3000

