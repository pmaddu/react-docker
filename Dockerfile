# with nginex
from node:alpine AS builder
workdir /app
copy ./package.json .
run npm install
copy . .
run npm run build

from nginx:alpine
expose 80
copy --from=builder /app/build /usr/share/nginx/html