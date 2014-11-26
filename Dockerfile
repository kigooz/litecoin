# bitcoin-testnet-box docker image

FROM ubuntu:12.04
MAINTAINER Mantas Radzevicius <mantas.radzevicius@gmail.com>

# deal with installation warnings
ENV TERM xterm

# litecoin deps
RUN apt-get update && apt-get install -y \
    wget \
    make

# create a non-root user
RUN adduser --disabled-login --gecos "" tester

# litecoin
WORKDIR /home/tester
RUN wget \
    --no-check-certificate \
    https://download.litecoin.org/litecoin-0.8.7.4/linux/litecoin-0.8.7.4-linux.tar.xz

RUN tar xvfJ litecoin-0.8.7.4-linux.tar.xz
RUN mv litecoin-0.8.7.4-linux/bin/64/* /usr/bin
RUN rm -rf litecoin-0.8.7.4-linux litecoin-0.8.7.4-linux.tar.xz

# copy the testnet-box files into the image
ADD . /home/tester/litecoin-testnet-box

# make tester user own the litecoin-testnet-box
RUN chown -R tester:tester /home/tester/litecoin-testnet-box
WORKDIR /home/tester/litecoin-testnet-box

# use the tester user when running the image
USER tester

# expose two rpc ports for the nodes to allow outside container access
EXPOSE 20001 20011
CMD ["/bin/bash"]
