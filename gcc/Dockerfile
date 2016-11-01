FROM ubuntu:14.04

MAINTAINER jmpews "jmpews@gmail.com"

# 修改源
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
&& sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
&& apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
# build-essential \
gcc \
gdb \
# python \
# python-pip \
vim \
curl \
wget \
git \
tmux

# 修改时区
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
# tmux配置文件
RUN wget --no-check-certificate -qO $HOME/.tmux.conf https://raw.githubusercontent.com/jmpews/configs/master/tmux/.tmux.conf
RUN tmux start-server
# vim配置文件
RUN wget --no-check-certificate -qO $HOME/.vimrc https://raw.githubusercontent.com/jmpews/configs/master/vim/.vimrc

# # Python环境配置
# RUN mkdir ~/.pip && echo '[global]\n\
# index-url = http://mirrors.aliyun.com/pypi/simple/\n\
# [install]\n\
# trusted-host = mirrors.aliyun.com' > ~/.pip/pip.conf

# # RUN wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
# RUN cd /root/ \
# 	&& wget --no-check-certificate -qO ./Python-3.5.2.tgz https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz \
#     && tar zxvf Python-3.5.2.tgz \
#     && cd /root/Python-3.5.2 \
#     && ./configure --prefix=/usr/local/python3.5.2 \
#     && make && make install

# Peda 安装
RUN GIT_SSL_NO_VERIFY=true git clone https://github.com/longld/peda.git ~/peda \
	&& echo "source ~/peda/peda.py" >> ~/.gdbinit \
	&& echo "DONE! debug your program with gdb and enjoy"

# config 配置
RUN  GIT_SSL_NO_VERIFY=true git clone https://github.com/jmpews/configs.git ~/configs \
    && cp ~/configs/vim/.vimrc ~/ \
    && cp ~/configs/vim/.vimrc.generate ~/ \
    && cp ~/configs/tmux/.tmux.conf ~/

WORKDIR /root
