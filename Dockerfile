FROM nvidia/cuda:10.2-cudnn7-runtime-ubuntu18.04
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update
RUN apt-get install -y \
    bsdtar \
    curl \
    git \
    locales \
    net-tools \
    wget \
    zsh \
    && rm -rf /var/lib/apt/lists/*

ENV ZSH_THEME agnoster
RUN locale-gen en_US.UTF-8
RUN /bin/sh -c chsh -s /bin/zsh

ENV SHELL /bin/zsh
ENV LANG=en_US.UTF-8

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && sh Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
RUN conda create -y -n ml python=3.7

COPY . /

RUN /bin/zsh -c "source activate ml && pip install -r requirements.txt"

RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN mkdir -p /root/.code-server/extensions

RUN wget https://github.com/microsoft/vscode-python/releases/download/2020.5.86806/ms-python-release.vsix
RUN code-server --install-extension ms-python-release.vsix

RUN mkdir -p /root/.local/share/code-server/User/
COPY settings.json /root/.local/share/code-server/User/
