FROM ubuntu:18.04

RUN apt-get update -qq -y && \
    apt-get install -y curl && \
    apt-get install -y \
                python3-dev \
                libmecab-dev \
                libicu-dev \
                jq  \
                xml2

WORKDIR /workspace/

RUN apt-get install -y git
RUN curl -sSL https://get.haskellstack.org/ | sh
RUN git clone https://github.com/LuminosoInsight/wikiparsec && \
    cd wikiparsec && \
    stack clean && \
    stack build && \
    stack install
RUN apt-get install -y python3-pip
RUN git clone https://github.com/PCerles/exquisite-corpus.git && \
    cd exquisite-corpus && \
    pip3 install -e .

RUN pip install regex==2018.02.21
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8


