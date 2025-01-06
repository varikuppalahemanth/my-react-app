# stage1:  Use an official Node.js runtime as the base image
FROM node:16 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .


# Stage 2: Production Stage
FROM node:16-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the production dependencies and built files from the previous stage
COPY --from=build /app /app
# Expose the port the app will run on
EXPOSE 3000

# Run the application (e.g., `npm start` assumes you have a start script in package.json)
CMD ["npm", "start"]
