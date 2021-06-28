FROM debian:buster-20210511-slim

ARG TERRAFORM_VERSION="0.15.0"
ARG AWSCLI_VERSION="2.2.7"

LABEL terraform_version=${TERRAFORM_VERSION}
LABEL aws_cli_version=${AWSCLI_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
ENV AWSCLI_VERSION=${AWSCLI_VERSION}
ENV TERRAFORM_VERSION=${TERRAFORM_VERSION}
RUN apt-get update \
    && apt-get install -y curl python3 python3-pip python3-boto unzip  \
    && curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip '*.zip' -d /usr/local/bin \
    && rm *.zip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD    ["/bin/bash"]