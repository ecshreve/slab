FROM ubuntu:jammy

RUN apt-get update \
	&& apt-get install -y \
	curl \
	git \
	golang \
	sudo \
	vim \
	wget \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update \
	&& apt-get install -y \
	apt-utils \
	bash \
	bat \
	exa \
	fd-find \
	fzf \
	gnupg \
	htop \
	iftop \
	net-tools \
	prettyping \
	ripgrep \
	thefuck \
	software-properties-common \
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
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}
USER ${USER}
WORKDIR /home/${USER}
