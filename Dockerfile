FROM alpine:3.14

ARG APPUSER_GROUP_ID=1000
ARG APPUSER_USER_ID=1000

RUN echo -e "\n\n      *** Welcome to the Matrix ***\n\n" > /etc/motd

RUN apk add --no-cache bash vim

RUN addgroup -g $APPUSER_GROUP_ID -S appgroup && adduser -u $APPUSER_USER_ID -S appuser -G appgroup

USER appuser
WORKDIR /home/appuser

RUN mkdir logs

RUN echo "cat /etc/motd" > .bashrc

COPY fumper .

ENTRYPOINT ["/home/appuser/fumper", "/home/appuser/fumper.pid", "/home/appuser/logs"]

CMD [""]
