FROM summerwind/actions-runner:latest

# Install Ansible PPA
RUN sudo apt install -y software-properties-common \
    && sudo add-apt-repository --yes --update ppa:ansible/ansible \
    && sudo apt update \
    && sudo apt install -y ansible

# Sanity Check
RUN ansible --version
