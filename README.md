# AWS Full-Stack Development Environment

This project sets up a secure and consistent AWS full-stack development environment using Docker Compose.

## Setup

1. Copy the `.env.template` file to `.env`:   ```
   cp .env.template .env   ```

2. Edit the `.env` file with your AWS credentials.

3. Create a `code` directory for your projects:   ```
   mkdir code   ```

4. Build and start the container:   ```
   docker-compose up -d   ```

5. Access the container:   ```
   docker-compose exec full-stack-dev bash   ```

## Features

- Ubuntu 22.04 base image
- AWS CLI v2
- Python 3 with boto3
- Node.js and npm
- Git
- Non-root user
- Mounted SSH keys directory
- Mounted code directory
- Exposed ports for Node.js (3000) and Python (8000) applications

## Security Note

Never commit your `.env` file or share it publicly. It contains sensitive credentials.
