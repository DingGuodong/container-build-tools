FROM debian:bullseye

LABEL MAINTAINER="DingGuodong <dgdenterprise@gmail.com>"
LABEL DESCRIPTION="Dockerfile for build the image for building full stack application."
LABEL BUILDDATE="20211015"

# Select mirrors.tuna.tsinghua.edu.cn as our fastest mirrior for Debian in China region.
RUN sed -i 's@security.debian.org@mirrors.tuna.tsinghua.edu.cn@g; s@deb.debian.org@mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list \
        && apt-get update

# Install essential packages for building application.
RUN apt-get install -q -y git subversion make build-essential zip sudo rpm curl wget vim openssh-client zlib1g-dev libssl-dev libreadline-dev libyaml-dev iconv cconv bash-completion

# Install packages for LAMP.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy php php-mysql php-ldap mariadb-server

# Install packages for Java.
RUN apt-get install -qy default-jre

# Reduce container image size. https://www.fromlatest.io/#/
RUN rm -rf /var/lib/apt/lists/*

CMD ["bash"]

