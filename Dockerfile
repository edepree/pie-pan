# syntax=docker/dockerfile:1

FROM cgr.dev/chainguard/wolfi-base:latest

LABEL org.opencontainers.image.description="A Container for Pi" \
      org.opencontainers.image.source="https://github.com/edepree/pie-pan"

# operating system packages
RUN apk add --no-cache \
        bash \
        curl \
        fd \
        git \
        jq \
        nodejs \
        npm \
        python3 \
        ripgrep \
        uv

# nodejs packages
RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent

# pi packages
RUN pi install git:github.com/obra/superpowers

# pi settings
COPY --chmod=755 pi/settings.json ~/.pi/agent/settings.json

ENV COLORTERM=truecolor

COPY --chmod=755 entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
