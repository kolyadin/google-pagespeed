FROM node:7-alpine

MAINTAINER aleksey.kolyadin@isobar.ru

RUN npm install --global psi-v4

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]