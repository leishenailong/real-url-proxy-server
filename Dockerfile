FROM ubuntu
MAINTAINER leishenailong
WORKDIR /app
COPY / /app
RUN mkdir /usr/local/Python-3.7.2
RUN apt-get update
RUN apt install -y git 
RUN apt-get update && \
    apt-get install -y python3 \
                        python3-dev \
                        python3-pip \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install requests -i https://pypi.douban.com/simple
RUN pip3 install PyExecJS -i https://pypi.douban.com/simple

EXPOSE 80
CMD python3 /app/real-url-proxy-server.py -p 80 -r 30000
