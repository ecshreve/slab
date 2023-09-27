FROM ecshreve/coderbase:latest

# Run everything as root
USER root

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

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

USER coder
WORKDIR /home/coder

