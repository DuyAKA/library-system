FROM node:16

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package*.json ./

# Install the dependencies
RUN npm install nodemon -g
RUN rm -rf node_modules
RUN npm install 


# Copy the rest of the application code into the container
COPY . .

# Expose port 3000 for the backend application
EXPOSE 1107

# Start the backend application
CMD ["npm", "start"]
