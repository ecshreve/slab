FROM ecshreve/devbox-core:latest

# Run everything as root
USER root

RUN apt-get update && apt-get install -y \
	apt-utils \
	bat \
	exa \
	fd-find \
	fzf \
	htop \
	iftop \
	net-tools \
	prettyping \
	ripgrep \
	thefuck \
	&& rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/batcat /usr/bin/bat \
	&& ln -s /usr/bin/fd-find /usr/bin/fd

RUN add-apt-repository ppa:aos1/diff-so-fancy \
	&& add-apt-repository ppa:fish-shell/release-3 \
	&& apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y \
	diff-so-fancy \
	fish \
	&& rm -rf /var/lib/apt/lists/*

ARG USER=coder
RUN useradd ${USER} \
      --create-home \
      --shell=/bin/bash \
      --groups=docker,sudo \
      --uid=1001 \
      --user-group && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

USER ${USER}
WORKDIR /home/${USER}
