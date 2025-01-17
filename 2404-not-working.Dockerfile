FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa

# Install Python 3.9
RUN apt-get update && apt-get install --quiet --yes python3.9

# Set up Python environment
WORKDIR /app
RUN --mount=from=ghcr.io/astral-sh/uv:latest,source=/uv,target=/bin/uv \
    uv init --python=/usr/bin/python3.9 --verbose
