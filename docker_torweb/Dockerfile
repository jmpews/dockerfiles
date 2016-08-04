FROM daocloud.io/library/ubuntu:14.04

MAINTAINER jmpews "jmpews@gmail.com"

# 修改源
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse\n\
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse\n\
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse' > /etc/apt/sources.list \
&& apt-get update
# 不进行交互
# 先检查有没有安装 sqlite3 ssl
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
                                    build-essential \
                                    g++ \
                                    gcc \
                                    libc6-dev \
                                    make \
                                    python-pip \
                                    libssl-dev \
                                    openssl \
                                    sqlite3 \
                                    libsqlite3-dev \
    && apt-get install -y wget curl git
# RUN rm -rf /var/lib/apt/lists/*

# 修改时区
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# 配置应用目录
RUN mkdir -p /app/torweb
COPY torweb /app/torweb/
COPY Python-3.5.2.tgz /root/

# Python环境配置
RUN mkdir ~/.pip && echo '[global]\n\
index-url = http://mirrors.aliyun.com/pypi/simple/\n\
[install]\n\
trusted-host = mirrors.aliyun.com' > ~/.pip/pip.conf

# RUN wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
RUN cd /root/ \
    && tar zxvf Python-3.5.2.tgz \
    && cd /root/Python-3.5.2 \
    && ./configure --prefix=/usr/local/python3.5.2 \
    && make && make install

# 使用virtualenv来做部署环境，发现好像没啥用
# RUN pip install virtualenv \
#     && mkdir /virtualenv \
#     && cd /virtualenv \
#     && virtualenv -p /usr/local/python3.5.2/bin/python3 python3.5.2
# RUN . /virtualenv/python3.5.2/bin/activate \
#     && pip install -r requirements.txt

RUN cd /app/torweb \
    &&/usr/local/python3.5.2/bin/pip3 install -r requirements.txt

WORKDIR /app/torweb
# EXPOSE 8888
# CMD ["/usr/local/python3.5.2/bin/python3", "app.py"]
# docker run -d -p 8888:8888 --link mysql:db 

