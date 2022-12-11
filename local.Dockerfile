FROM node:15.12.0-alpine3.10 as build-stage

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH
ENV http_proxy "http://proxy-mu.intel.com:911"
ENV https_proxy "http://proxy-mu.intel.com:912"
ENV no_proxy "localhost,intel.com,192.168.0.0/16,172.16.0.0/12,127.0.0.0/8,10.0.0.0/8"
# use "Package IndeX for Intel" https://pixi-ui.intel.com/
RUN npm set registry https://pixi.intel.com/

COPY package.json ./
RUN npm ci

EXPOSE 5173
CMD ["npm", "run", "dev"]
