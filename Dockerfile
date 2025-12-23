# THIS NEW VERSION CHANGES SUMMARY LINES
FROM hugomods/hugo:0.152.2 as builder
WORKDIR /app/nemeclu
COPY . .
RUN hugo --minify --gc --forceSyncStatic

FROM caddy:2.10

COPY Caddyfile /etc/caddy/
COPY --from=builder /app/nemeclu/public /usr/share/caddy
