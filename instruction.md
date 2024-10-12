# Setting up a Secure AWS Full-Stack Development Environment

This guide outlines the steps to set up a secure and consistent AWS full-stack development environment using Docker Compose and a .env file for storing your credentials.

## Project Structure

1. Create a new directory for your project (e.g., aws-fullstack-dev-env).
2. Inside the directory, create the following files:
   - Dockerfile
   - docker-compose.yml
   - .env.template
   - .gitignore
   - README.md

## File Contents

### Dockerfile

The Dockerfile sets up an Ubuntu-based image with the following components:
- Ubuntu 22.04 as the base image
- Basic development tools (git, curl, vim, etc.)
- Python3 and pip
- Node.js and npm
- AWS CLI v2
- AWS Python SDK (boto3)
- A non-root user named 'devuser'

### docker-compose.yml

The docker-compose.yml file defines the service for your development environment:
- Builds the image from the Dockerfile
- Uses the .env file for environment variables
- Mounts the host's SSH keys directory (read-only) and a local 'code' directory
- Exposes ports 3000 and 8000 for web development
- Keeps the container running with a tail command

### .env.template

Create a template for the .env file that will store your AWS credentials:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_DEFAULT_REGION
- AWS_SESSION_TOKEN (if using temporary credentials)

### .gitignore

Add .env to the .gitignore file to prevent accidental commit of sensitive information.

### README.md

Create a README.md file with instructions on how to set up and use the development environment.

## Setup Instructions

1. Copy the .env.template to .env and fill in your AWS credentials.
2. Create a 'code' directory in the project folder for your development files.
3. Build and start the container using `docker-compose up -d`.
4. Access the container using `docker-compose exec full-stack-dev bash`.

## Security Considerations

- Never commit your .env file or share it publicly.
- Use the least privileged AWS credentials necessary for your development tasks.
- Regularly update the base image and installed packages to patch security vulnerabilities.

## Additional Features

This setup provides:
- A full-stack development environment with tools for both frontend and backend development
- AWS CLI and SDK for cloud development
- A non-root user for improved security
- Mounted directories for SSH keys and your code
- Port forwarding for web development servers

You can further customize this environment by adding more tools or configurations to the Dockerfile as needed for your specific development requirements.
