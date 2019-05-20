
FROM ubuntu:18.04

MAINTAINER morris "cc12703@gmail.com"


# Set locale
ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

RUN apt-get clean && apt-get update -qq && apt-get install -qq -y apt-utils locales && locale-gen $LANG



ENV DEBIAN_FRONTEND="noninteractive" \
    TERM=dumb \
    DEBIAN_FRONTEND=noninteractive


# Installing packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        openjdk-8-jdk \
        autoconf \
        build-essential \
        bzip2 \
        curl \
        gcc \
        git \
        groff \
        lib32stdc++6 \
        lib32z1 \
        lib32z1-dev \
        lib32ncurses5 \
        libc6-dev \
        libgmp-dev \
        libmpc-dev \
        libmpfr-dev \
        libxslt-dev \
        libxml2-dev \
        m4 \
        make \
        ncurses-dev \
        ocaml \
        openssh-client \
        pkg-config \
        rsync \
        software-properties-common \
        unzip \
        wget \
        zip \
        zlib1g-dev \
        p7zip-full \
        openssh-server  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*





# Install Android SDK
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && \
    unzip sdk-tools-linux-3859397.zip -d /usr/local/android-sdk  && \
    rm sdk-tools-linux-3859397.zip && \
    yes | /usr/local/android-sdk/tools/bin/sdkmanager \
          "platform-tools" \
          "platforms;android-23" \
          "platforms;android-24" \
          "platforms;android-25"  \
          "platforms;android-26"  \
          "platforms;android-27"  \
          "platforms;android-28"  \
          "build-tools;21.1.1" \
          "build-tools;26.0.2" \
          "build-tools;27.0.3" \
          "build-tools;28.0.3" \
          "cmake;3.6.4111459" \
          "ndk-bundle"  \
          "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.1" \
          "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2" 




# Environment variables
ENV ANDROID_HOME=/usr/local/android-sdk \
    ANDROID_SDK_HOME=$ANDROID_HOME  \
    ANDROID_NDK_HOME=/usr/local/android-sdk/ndk-bundle \
    PATH=$PATH:$ANDROID_SDK_HOME/tools/bin  \
    PATH=$PATH:$ANDROID_SDK_HOME/tools  \
    PATH=$PATH:$ANDROID_SDK_HOME/platform-tools  \
    PATH=$PATH:$ANDROID_NDK_HOME   \
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/  



# Fix permissions
RUN chmod -R a+rx $ANDROID_HOME $ANDROID_SDK_HOME $ANDROID_NDK_HOME