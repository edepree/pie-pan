# syntax=docker/dockerfile:1

FROM cgr.dev/chainguard/wolfi-base:latest

LABEL org.opencontainers.image.description="A Container for Pi" \
      org.opencontainers.image.source="https://github.com/edepree/pie-pan"

# operating system packages
RUN apk add --no-cache \
        bash \
        bun \
        curl \
        fd \
        git \
        jq \
        nodejs \
        python3 \
        ripgrep \
        uv

# nodejs packages
ENV PATH="~/.bun/bin:${PATH}"
RUN bun add -g --ignore-scripts @earendil-works/pi-coding-agent

# pi settings
COPY --chmod=755 pi/settings.json ~/.pi/agent/settings.json

ENV COLORTERM=truecolor

COPY --chmod=755 entrypoint.sh entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
