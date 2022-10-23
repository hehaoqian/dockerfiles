FROM ubuntu:jammy

SHELL ["/bin/bash", "-c"]
RUN export DEBIAN_FRONTEND=noninteractive && export TZ=Etc/UTC && \
    apt-get update && \
    apt-get install -y eatmydata && \
    eatmydata apt-get dist-upgrade -y && \
    eatmydata apt-get install --no-install-recommends -y locales locales-all && \
    eatmydata sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    eatmydata locale-gen && \
    eatmydata update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && export TZ=Etc/UTC && \
    eatmydata apt-get install --no-install-recommends -y \
        apt-file \
        apt-utils \  
        autoconf \
        automake \
        bash \
        bc \
        binutils-doc \
        bison \
        bsdmainutils \
        bzip2 \
        ca-certificates \
        ccache \
        clang \
        clang-format \
        clang-tidy \
        cmake \
        cpp-doc \
        curl \
        dbus \
        debianutils \
        diffutils \
        exuberant-ctags \
        findutils \
        flex \
        g++ \
        gcc \
        gcc-doc \
        gcovr \
        gdb \
        gdb-doc \
        genisoimage \
        gettext \
        git \
        gnupg \
        hostname \
        kcachegrind \
        less \
        libaio-dev \
        libasan5 \
        libasound2-dev \
        libattr1-dev \
        libbrlapi-dev \
        libbz2-dev \
        libc6-dbg \
        libc6-dev \
        libcacard-dev \
        libcap-ng-dev \
        libcapstone-dev \
        libcmocka-dev \
        libcurl4-gnutls-dev \
        libdaxctl-dev \
        libdrm-dev \
        libepoxy-dev \
        libfdt-dev \
        libffi-dev \
        libfuse3-dev \
        libgbm-dev \
        libgcrypt20-dev \
        libglib2.0-dev \
        libglusterfs-dev \
        libgnutls28-dev \
        libgtk-3-dev \
        libibumad-dev \
        libibverbs-dev \
        libiscsi-dev \
        libjemalloc-dev \
        libjpeg-turbo8-dev \
        libjson-c-dev \
        liblttng-ust-dev \
        liblzo2-dev \
        libncursesw5-dev \
        libnfs-dev \
        libnuma-dev \
        libpam0g-dev \
        libpcre2-dev \
        libpixman-1-dev \
        libpmem-dev \
        libpng-dev \
        libpulse-dev \
        librbd-dev \
        librdmacm-dev \
        libsasl2-dev \
        libsdl2-dev \
        libsdl2-image-dev \
        libseccomp-dev \
        libselinux1-dev \
        libslirp-dev \
        libsnappy-dev \
        libspice-protocol-dev \
        libspice-server-dev \
        libssh-dev \
        libsystemd-dev \
        libtasn1-6-dev \
        libubsan1 \
        libudev-dev \
        libusb-1.0-0-dev \
        libusbredirhost-dev \
        libvdeplug-dev \
        libvirglrenderer-dev \
        libvte-2.91-dev \
        libxen-dev \
        libzstd-dev \
        lldb \
        llvm \
        locales \
        make \
        man-db \
        multipath-tools \
        ncat \
        net-tools \
        nettle-dev \
        ninja-build \
        openssh-client \
        openssh-server \
        perl-base \
        pkgconf \
        python3 \
        python3-dev \
        python3-numpy \
        python3-opencv \
        python3-pillow \
        python3-pip \
        python3-setuptools \
        python3-sphinx \
        python3-sphinx-rtd-theme \
        python3-venv \
        python3-wheel \
        python3-yaml \
        rpm2cpio \
        rr \
        ruby-full \
        sed \
        sparse \
        sudo \
        systemtap-sdt-dev \
        tar \
        tcl \
        tcl-tclreadline \
        tesseract-ocr \
        tesseract-ocr-eng \
        texinfo \
        tmux \
        unzip \
        valgrind \
        valgrind-dbg \
        valgrind-mpi \
        vim \
        wget \
        xfslibs-dev \
        zip \
        zlib1g-dev \
        && \
    eatmydata apt-get autoremove -y && \
    eatmydata apt-get autoclean -y && \
    eatmydata apt-file update

# https://vulkan.lunarg.com/sdk/home#linux
RUN wget https://packages.lunarg.com/lunarg-signing-key-pub.asc -O /root/lunarg-signing-key-pub.asc
RUN cat /root/lunarg-signing-key-pub.asc | apt-key add -
RUN wget https://packages.lunarg.com/vulkan/1.3.224/lunarg-vulkan-1.3.224-focal.list -O /etc/apt/sources.list.d/lunarg-vulkan-1.3.224-focal.list

RUN export DEBIAN_FRONTEND=noninteractive && export TZ=Etc/UTC && \
    apt-get update
RUN export DEBIAN_FRONTEND=noninteractive && export TZ=Etc/UTC && \
    eatmydata apt-get install --no-install-recommends -y \
	vulkan-sdk

ARG HOME=/home/main
RUN mkdir -p $HOME
RUN groupadd -g 1000 main
RUN useradd -d $HOME -g 1000 -u 1000 -s /bin/bash main
RUN chown 1000:1000 $HOME
USER main

RUN cd $HOME && git clone --depth=1 https://github.com/emscripten-core/emsdk.git -b 3.1.24
RUN cd $HOME/emsdk && ./emsdk install latest && ./emsdk activate latest
RUN echo 'source "/home/main/emsdk/emsdk_env.sh"' >> $HOME/.bashrc

RUN echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc

RUN source ~/.bashrc && eatmydata gem install jekyll bundler

RUN eatmydata curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf > $HOME/rustup.sh 
RUN eatmydata chmod +x $HOME/rustup.sh 
RUN source ~/.bashrc && eatmydata $HOME/rustup.sh --profile default -y
RUN echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc

RUN eatmydata python3 -m venv $HOME/venv
RUN source $HOME/venv/bin/activate && eatmydata python3 -m pip install \
        cmake-format \
        pre-commit
RUN echo 'export PATH="$HOME/venv/bin:$PATH"' >> ~/.bashrc

RUN echo '[[ -f ~/.bashrc ]] && . ~/.bashrc' >> ~/.bash_profile

RUN source ~/.bashrc && mkdir -p $HOME/temp && cd $HOME/temp && \
        eatmydata git clone https://github.com/hehaoqian/blog.git && \
        cd blog && git checkout 15f75286f72f9babc1579335ad10a159297f8be2 && eatmydata bundle install
RUN rm -rf $HOME/temp

RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
RUN echo 'export GPG_TTY=$(tty)' >> ~/.bashrc
RUN echo 'gpg-agent --pinentry-program=/usr/bin/pinentry --daemon' >> ~/.bashrc

USER root
ARG HOME=/root
ENV LANG en_US.UTF-8
RUN chsh -s /bin/bash

RUN wget https://github.com/microsoft/vcpkg/archive/refs/tags/2022.10.19.tar.gz -O /root/vcpkg-2022.10.19.tar.gz
RUN cd /root && tar -xvf vcpkg-2022.10.19.tar.gz
RUN /root/vcpkg-2022.10.19/bootstrap-vcpkg.sh -disableMetrics

RUN echo -e '\nPort 60022' >> /etc/ssh/sshd_config

# For sshd
EXPOSE 60022/tcp
EXPOSE 60022/udp

# For Jekyll
EXPOSE 4000/tcp
EXPOSE 4000/udp

COPY docker_cmd.sh /root/docker_cmd.sh
RUN chmod +x /root/docker_cmd.sh
CMD /root/docker_cmd.sh

