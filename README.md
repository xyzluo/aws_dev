# AWS Development Environment

This project sets up a secure and consistent AWS development environment using Docker Compose.

## Setup

1. Copy the `.env.template` file to `.env`:   ```
   cp .env.template .env   ```

2. Edit the `.env` file with your AWS credentials.

3. Create a `code` directory for your projects:   ```
   mkdir code   ```

4. Build and start the container:   ```
   docker-compose up -d   ```

5. Access the container:   ```
   docker-compose exec aws-dev bash   ```

## Features

- AWS CLI v2
- Python 3 with boto3
- Git
- Non-root user
- Mounted SSH keys directory
- Mounted code directory

## Building and Pushing the Docker Image

You can build and push the Docker image using either Docker commands or Docker Compose.

### Using Docker commands:

1. Ensure you're logged in to Docker Hub:
   ```
   docker login
   ```

2. Build and tag the image:
   ```
   docker build -t duduli168/aws-fullstack-dev:latest .
   ```

3. Push the image:
   ```
   docker push duduli168/aws-fullstack-dev:latest
   ```

### Using Docker Compose:

1. Build the image:
   ```
   docker-compose build
   ```

2. Push the image:
   ```
   docker-compose push
   ```

   Or, combine these steps:
   ```
   docker-compose build aws-dev && docker-compose push aws-dev
   ```

Note: Replace "duduli168" with your actual Docker Hub username if it's different.

## Security Note

Never commit your `.env` file or share it publicly. It contains sensitive credentials.
