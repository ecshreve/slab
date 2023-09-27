FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

# Install the Docker apt repository
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get upgrade --yes && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes ca-certificates
COPY docker-archive-keyring.gpg /usr/share/keyrings/docker-archive-keyring.gpg
COPY docker.list /etc/apt/sources.list.d/docker.list

# Install baseline packages
RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes \
      bash \
      build-essential \
      containerd.io \
      curl \
      docker-ce \
      docker-ce-cli \
      docker-compose-plugin \
      htop \
      locales \
      man \
      python3 \
      python3-pip \
      software-properties-common \
      sudo \
      systemd \
      systemd-sysv \
      unzip \
      vim \
      wget \
      rsync && \
    # Install latest Git using their official PPA
    add-apt-repository ppa:git-core/ppa && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --yes git

# Enables Docker starting with systemd
RUN systemctl enable docker

# Add docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Make typing unicode characters in the terminal work.
ENV LANG en_US.UTF-8

# cli tools
RUN apt-get update && apt-get install -y \
	apt-utils \
	bat \
	exa \
	fd-find \
	fzf \
	htop \
	net-tools \
	prettyping \
	ripgrep \
	&& rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/batcat /usr/bin/bat \
	&& ln -s /usr/bin/fd-find /usr/bin/fd

RUN add-apt-repository ppa:aos1/diff-so-fancy \
	&& add-apt-repository ppa:fish-shell/release-3 \
	&& apt-get update -y \
	&& apt-get install -y \
	diff-so-fancy \
	fish \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://apt.releases.hashicorp.com/gpg" | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
RUN apt-get update && apt-get install -y \
	terraform \
	consul \
	nomad \
	vault \
	packer \
	vagrant \
	&& rm -rf /var/lib/apt/lists/*

# Install go
RUN curl -L "https://go.dev/dl/go1.21.1.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -

# Install ansible
RUN pip3 install --upgrade pip; \
    pip3 install ansible

ARG USER=coder
RUN useradd ${USER} \
      --create-home \
      --shell=/bin/bash \
      --groups=docker,sudo \
      --user-group && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/${USER}/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

USER ${USER}
WORKDIR /home/${USER}
