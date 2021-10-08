FROM ghcr.io/szab100/gitpod-k3s-qemu

ENV trigger_rebuild 1

USER root

# Install Vault + other required utils
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
    && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && apt-get install -y \
  jq \
  vault \
  golint \
  libpq-dev postgresql-client \
  && rm -rf /var/lib/apt/lists/*

# Install Argo CLI
RUN wget https://github.com/argoproj/argo-workflows/releases/download/v3.1.13/argo-linux-amd64.gz \
    && gunzip argo-linux-amd64.gz \
    && mv ./argo-linux-amd64 /usr/local/bin/argo \
    && chmod +x /usr/local/bin/argo

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_amd64.zip \
    && unzip terraform_*.zip \
    && mv ./terraform /usr/local/bin/ \
    && chmod +x /usr/local/bin/terraform \
    && rm terraform_*.zip

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf ./aws; rm awscliv2.zip
