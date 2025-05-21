FROM node:20-alpine AS base

FROM base AS builder
WORKDIR /app
COPY . .
#ENV NODE_ENV=development
ENV PORT=3000
ENV HOSTNAME="0.0.0.0"
RUN npm install
RUN npm run build

FROM base AS deploy
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nextjs -u 1001

WORKDIR /app
COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000
ENV PORT=3000
CMD npm run start 
