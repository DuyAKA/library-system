FROM node:16

# Set the working directory to /app
WORKDIR /app

COPY . .
RUN rm -rf node_modules

# Copy the package.json and package-lock.json files into the container
COPY package*.json ./

# Install the dependencies
# RUN npm install -g @vue/cli@latest
# RUN npm install @vue/cli-service

RUN npm install 

RUN npm install -g serve 

RUN npm run build


# Expose port 3000 for the backend application
EXPOSE 3000

# Start the backend application
CMD ["serve", "dist"]
# CMD ["npm", "run", "serve"]
