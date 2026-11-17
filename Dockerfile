# PancakeSlicer on Railway: the official upstream image (zimengxiong/pancakeslicer 0.5.0, AGPL-3.0), unmodified.
# This layer only bakes Railway defaults (plain template values don't survive template generation):
# listen on 8080, printer networking off (a LAN printer is not reachable from Railway), 2 slices at once.
# USER 0 because Railway volumes mount root-owned and the upstream image runs as uid 65532.
FROM ghcr.io/zimengxiong/pancakeslicer:0.5.0
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/pancakeslicer"
USER 0
ENV ORCA_WEB_LISTEN=0.0.0.0:8080 \
    ORCA_WEB_PRINTER_NETWORK=off \
    ORCA_WEB_MAX_JOBS=2 \
    PANCAKE_STAGE_CACHE_MAX_MB=1024
EXPOSE 8080
