# Document Base
FROM node:lts as base

ENV NPM_CONFIG_LOGLEVEL=warn
ENV NPM_CONFIG_COLOR=false

WORKDIR /var/www/document

COPY . .

RUN npm install

## Document Development
FROM base as development
CMD ["npm", "start", "--", "--host=0.0.0.0", "--poll"]

## Document Production
FROM base as production
CMD ["npm", "start", "--", "--host=0.0.0.0"]