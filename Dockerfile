FROM hugomods/hugo:0.125.5 as builder
WORKDIR /app/nemeclu
COPY . .
RUN hugo --minify --gc --forceSyncStatic

FROM caddy:2.7

COPY --from=builder /app/nemeclu/public /usr/share/caddy
