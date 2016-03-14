FROM node:0.10-wheezy

ENV HOME /data

WORKDIR /data
RUN git clone https://github.com/LeeAbell79/dogeparty-wallet.git

WORKDIR /data/dogeparty-wallet
RUN npm install -g grunt-cli bower

WORKDIR /data/dogeparty-wallet/src
RUN bower --allow-root install

WORKDIR /data/dogeparty-wallet
RUN npm install
RUN grunt build

WORKDIR /data
RUN npm install -g dogeparty-wallet-dev-server

ENV NODE_ENV production
ENV WALLET_PATH=/data/dogeparty-wallet/build
ENV DOGEBLOCKD_URL=http://dogeblockd:4100

CMD ["dogeparty-wallet-dev-server"]

