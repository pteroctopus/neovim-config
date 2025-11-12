# This Dockerfile can be used to tryout this configuration with the last stable neovim before update
#
# To build the image for arm64 architecture use:
# docker buildx build --platform linux/arm64 -t <REPO>/nvim:<TAG>-arm64 --load -f Dockerfile .
# and for amd64 architecture use:
# docker buildx build --platform linux/amd64 -t <REPO>/nvim:<TAG>-amd64 --load -f Dockerfile .
#
# To run the container and mount your home directory to the container, use:
# docker run -v $(realpath $HOME):/home/user/ext -it <REPO>/nvim:<TAG>-arm64
#
# To run nvim once inside the container, you can use: nvim and all plugins will be automaticaly installed
# Additionally to install Mason tools inside neovim use: MasonToolsInstall (this will not be automatic because Mason Tools plugin iz Lazy loaded)
FROM ubuntu:22.04

# Install dependencies as root
RUN apt update && apt install -y \
    software-properties-common \
    curl \
    git \
    build-essential \
    cmake \
    ripgrep \
    fd-find \
    python3 \
    python3-pip \
    python3-venv \
    ruby \
    ruby-dev \
    openjdk-17-jdk \
    maven \
    ca-certificates \
    gnupg && \
    add-apt-repository ppa:longsleep/golang-backports && \
    apt update && apt install -y golang-go && \
    # Create non-root user
    groupadd -r user && useradd -m -g user user && \
    rm -rf /var/lib/apt/lists/*

# Build and install Neovim
RUN git clone https://github.com/neovim/neovim /tmp/neovim && \
    cd /tmp/neovim && \
    git checkout stable && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    make install && \
    rm -rf /tmp/neovim

# Switch to non-root user
USER user
ENV HOME=/home/user
WORKDIR /home/user

# Install nvm, Node.js (v22), and npm as the user
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash && \
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc && \
    echo 'nvm install 22 && nvm use 22 && nvm alias default 22' >> ~/.bashrc && \
    bash -lc "nvm install 22 && nvm use 22 && nvm alias default 22" && \
    # Install global npm packages using nvm's node
    bash -lc "npm install -g tree-sitter-cli" && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y

# Set up Neovim config
RUN git clone https://github.com/pteroctopus/neovim-config.git /home/user/.config/nvim && \
    cd /home/user/.config/nvim && \
    git switch feature/new-lsp-config

ENTRYPOINT ["/bin/bash"]
