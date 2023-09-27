FROM ecshreve/codertools:latest

# Run everything as root
USER root

ARG USER=eric
RUN useradd ${USER} \
      --create-home \
      --shell=/bin/bash \
      --groups=docker,sudo \
      --uid=1001 \
      --user-group && \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/nopasswd

ENV GOPATH /home/${USER}/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

USER ${USER}
WORKDIR /home/${USER}
