FROM ghcr.io/paperclipai/paperclip:latest

USER root

# Install Python 3 + pip + hermes-agent
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends python3 python3-pip python3-venv && \
    pip3 install --break-system-packages hermes-agent && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
