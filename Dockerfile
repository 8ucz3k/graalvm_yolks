FROM ghcr.io/graalvm/graalvm-community:25
RUN microdnf install -y curl ca-certificates openssl git tar bash sqlite fontconfig
RUN useradd -d /home/container container

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"] 
