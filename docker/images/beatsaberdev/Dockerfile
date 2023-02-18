FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV ANDROID_NDK_HOME "/sdk/ndk-bundle"
ENV PATH "$PATH:$ANDROID_NDK_HOME:/sdk/cmake/3.22.1/bin"

RUN mkdir /sdk
COPY qpm-rust /usr/bin/
COPY ninja /usr/bin/
COPY templatr /usr/bin/
COPY cmdline-tools/ /cmdline-tools

RUN apt-get update && apt-get install -y default-jre wget apt-transport-https software-properties-common git
RUN wget -q "https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb"
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update && apt-get install -y powershell

RUN yes | /cmdline-tools/bin/sdkmanager --sdk_root=/sdk --install ndk-bundle platform-tools "cmake;3.22.1"

WORKDIR /mnt

ENTRYPOINT pwsh
