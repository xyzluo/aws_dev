FROM ubuntu:22.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Accept build arguments for user ID and group ID
ARG USER_ID
ARG GROUP_ID
ARG USERNAME

# print user id and group id
RUN echo "User ID: $USER_ID"
RUN echo "Group ID: $GROUP_ID"
RUN echo "Username: $USERNAME"

# Update and install basic tools
RUN apt-get update && apt-get install -y \
    curl \
    git \
    gnupg \
    lsb-release \
    software-properties-common \
    sudo \
    unzip \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

# Install AWS Python SDK (boto3)
RUN pip3 install --no-cache-dir boto3

# Install Terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update && apt-get install -y terraform \
    && rm -rf /var/lib/apt/lists/*

# print user id and group id
RUN echo "User ID: $USER_ID"
RUN echo "Group ID: $GROUP_ID"
RUN echo "Username: $USERNAME"


# Create a non-root user with the same UID and GID as the host user
RUN groupadd -g ${GROUP_ID:-1000} ${USERNAME:-user} \
    && useradd -m -u ${USER_ID:-1000} -g ${GROUP_ID:-1000} -s /bin/bash ${USERNAME:-user} \
    && echo "${USERNAME:-user} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME

# Set working directory
WORKDIR /home/$USERNAME

# Set default command
CMD ["/bin/bash"]
