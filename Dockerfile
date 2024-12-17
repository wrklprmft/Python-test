FROM python:3.7-slim

WORKDIR /app
# Set environment variables insecurely (exposing secrets)
ENV SECRET_KEY="insecure_secret"

# Copy application code into the container
COPY app.py requirements.txt  /app/

# Install dependencies with root user and no version locking
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip install -r requirements.txt

# Expose the app to all interfaces insecurely
EXPOSE 5000

# Run the app as the root user (instead of a non-root user)
CMD ["python3", "app.py"]