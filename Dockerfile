FROM alpine:3.4
MAINTAINER ServiceAdvisor <service@advisor.com>

# packages
RUN apk add --update git  \
    python nodejs make g++ bash

ENV APP_HOME /usr/local

RUN npm install -g --unsafe-perm truffle@3.2.0  && \
    npm install -g --unsafe-perm ethereumjs-testrpc

RUN git clone https://github.com/oraclize/ethereum-bridge && \
    cd ethereum-bridge && \
    npm install && \
    cd .. && \
    git clone https://github.com/kmocherla/SampleProject && \
    cd SampleProject && \
    npm install && \
    truffle compile 

ADD entrypoint.sh .

RUN chmod +x entrypoint.sh

# Expose port
EXPOSE 8545
EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
