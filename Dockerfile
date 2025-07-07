# Build stage
FROM node:16-alpine as build

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package.json yarn.lock ./

# Install dependencies with a clean yarn install
RUN yarn install --frozen-lockfile --network-timeout 600000

# Copy the rest of the application
COPY . .

# Build the application
RUN yarn build

# Production stage
FROM node:16-alpine as production

# Set working directory
WORKDIR /app

# Install serve for serving the static files
RUN yarn global add serve@13.0.2

# Copy built assets from the build stage
COPY --from=build /app/build ./build

# Expose port 4000 (as specified in the serve script)
EXPOSE 4000

# Set environment variable
ENV NODE_ENV=production

# Start the application using serve
CMD ["serve", "-s", "build", "-l", "4000", "-n"]
