FROM node:20-alpine

RUN apk add --no-cache curl openssl ca-certificates tzdata && \
    npm install -g pm2@latest

ENV NODE_ENV=production \
    PORT=3000 \
    TZ=UTC

WORKDIR /app

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

CMD ["node", "server.js"]
