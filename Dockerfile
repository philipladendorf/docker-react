FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as runner
COPY --from=builder /app/build /usr/share/nginx/html
# No need to start nginx, it's started by default
# No need to expose port 80, it's exposed by default
# No need to specify CMD, it's specified by default
