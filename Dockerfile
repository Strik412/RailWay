FROM node:18-alpine

# Create app directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install --production

# Copy app source
COPY . .

# Default port and start
ENV PORT 3000
EXPOSE 3000
CMD ["node", "index.js"]
