# --- Stage 1: Build frontend (if using static build like React/Vue) ---
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .

# If it's a static site (React/Next build step):
# RUN npm run build

# --- Stage 2: Serve with Express (port 3000) ---
FROM node:18-alpine

WORKDIR /app
COPY --from=build /app ./

EXPOSE 3000

# Start frontend server (Express or npm start)
CMD ["npm", "start"]
