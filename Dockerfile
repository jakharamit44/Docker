# Use Ubuntu as the base image
FROM ubuntu:latest

# Install necessary packages (curl, wget, bash)
RUN apt-get update && \
    apt-get install -y curl wget && \
    apt-get clean

# Set the working directory
WORKDIR /root

# Download and run aaPanel installation script
RUN URL=https://www.aapanel.com/script/install_6.0_en.sh && \
    if [ -f /usr/bin/curl ]; then \
        curl -ksSO "$URL"; \
    else \
        wget --no-check-certificate -O install_6.0_en.sh "$URL"; \
    fi && \
    bash install_6.0_en.sh aapanel

# Expose port if necessary
# EXPOSE <port>

# Start aaPanel (if it doesn't start automatically)
# CMD <command to start aaPanel, if needed>

