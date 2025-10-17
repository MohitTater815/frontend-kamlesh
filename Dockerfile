# Stage 1: Build frontend (if you have any Node-based build, else skip)
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# If frontend is static HTML, skip build step
# RUN npm run build   # Uncomment if you later use React/Vue/etc.

# Stage 2: Nginx runtime
FROM nginx:1.27-alpine

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built or static frontend files to Nginx root
COPY --from=build /app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
