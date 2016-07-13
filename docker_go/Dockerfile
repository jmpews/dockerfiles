FROM daocloud.io/library/ubuntu:14.04

MAINTAINER jmpews "jmpews@gmail.com"

# 修改源
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update
# 不进行交互
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                                    g++ \
                                    gcc \
                                    libc6-dev \
                                    make
# 不进行交互
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl
RUN rm -rf /var/lib/apt/lists/*

# 修改时区
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# 安装go
RUN wget -qO- https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz | tar xvzf - -C /usr/local --strip-components=0

# 设置环境变量
ENV GOROOT /usr/local/go
ENV GOPATH /gogo
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin"
