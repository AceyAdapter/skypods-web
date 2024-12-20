# Stage 1: Build the application
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY package*.json ./

# Install dependencies
RUN npm install --frozen-lockfile

# Copy the entire source code
COPY . .

# Build the Next.js application
RUN npm run build

# Stage 2: Run the application in production
FROM node:18-alpine AS runner

WORKDIR /app

# Only copy the needed files from the builder stage
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package*.json ./

# Install only production dependencies
RUN npm install --frozen-lockfile --omit=dev

# Next.js uses PORT 3000 by default
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]