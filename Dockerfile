FROM ghcr.io/pycqa/bandit/bandit:latest

ENV GITHUB_TOKEN=""
ENV GITHUB_REPOSITORY=""

# Install additional dependencies if necessary
RUN apk add --no-cache git bash python3 py3-pip && \
    pip install pygithub

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Assuming the Dockerfile is located at the root of the repository
COPY post_comment.py /post_comment.py

ENTRYPOINT ["/entrypoint.sh"]