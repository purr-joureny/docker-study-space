FROM node:22.12.0-alpine3.21

ARG name
ARG age

WORKDIR /nest-app

COPY /test.js .

ENV name=${name} \
    age=${age}

CMD ["node", "/nest-app/test.js"]

