#  stage One - Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# stage Two - Run phase (using nginx)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html



