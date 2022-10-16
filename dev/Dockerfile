FROM ubuntu:jammy

RUN export DEBIAN_FRONTEND=noninteractive && export TZ=Etc/UTC && \
    apt-get update && \
    apt-get install -y eatmydata && \
    eatmydata apt-get dist-upgrade -y && \
    eatmydata apt-get install --no-install-recommends -y \
        apt-utils \  
        apt-file \
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
        nettle-dev \
        ninja-build \
        openssh-client \
        openssh-server \
        perl-base \
        pkgconf \
        python3 \
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
        valgrind \
        valgrind-dbg \
        valgrind-mpi \
        vim \
        wget \
        xfslibs-dev \
        zlib1g-dev \
        && \
    eatmydata apt-get autoremove -y && \
    eatmydata apt-get autoclean -y && \
    eatmydata apt-file update

RUN service ssh start

ENV HOME=/home/main
RUN mkdir -p $HOME
RUN groupadd -g 1000 main
RUN useradd -d $HOME -g 1000 -u 1000 -s /bin/bash main
RUN chown 1000:1000 /home/main
USER main

RUN eatmydata curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf > $HOME/rustup.sh 
RUN eatmydata chmod +x $HOME/rustup.sh 
RUN eatmydata $HOME/rustup.sh --profile default -y
ENV PATH=$HOME/.cargo/bin:$PATH

RUN eatmydata python3 -m venv $HOME/venv
ENV PATH=$HOME/venv/bin:$PATH
RUN eatmydata python3 -m pip install \
        cmake-format \
        pre-commit

USER root
RUN chsh -s /bin/bash
EXPOSE 22/tcp
EXPOSE 22/udp
COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh
ENTRYPOINT /root/entrypoint.sh

