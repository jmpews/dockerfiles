FROM daocloud.io/library/ubuntu:16.04

MAINTAINER jmpews "jmpews@gmail.com"

# 修改源
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
&& sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
&& apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
git \
gcc \
gdb \
vim \
wget \
tmux

# 修改时区
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
# tmux配置文件
RUN wget --no-check-certificate -qO $HOME/.tmux.conf https://raw.githubusercontent.com/jmpews/configs/master/tmux/.tmux.conf
RUN tmux start-server
# vim配置文件
RUN wget --no-check-certificate -qO $HOME/.vimrc https://raw.githubusercontent.com/jmpews/configs/master/vim/.vimrc

WORKDIR /root
