FROM ubuntu:bionic
MAINTAINER Ajeeth.Samuel@gmail.com

ENV RELEASE 0.7.1

RUN apt-get update && \
	apt-get install -y unzip && \
	apt-get clean

WORKDIR /
RUN mkdir /app
ADD https://github.com/gophish/gophish/releases/download/$RELEASE/gophish-v$RELEASE-linux-64bit.zip /app/
RUN unzip /app/gophish-v$RELEASE-linux-64bit.zip && rm /app/gophish-v$RELEASE-linux-64bit.zip
WORKDIR /app
RUN cd /app && sed -i "s|127.0.0.1|0.0.0.0|g" config.json
RUN sed -i "s|gophish.db|database/gophish.db|g" config.json
RUN chmod +x ./gophish

VOLUME ["/app/database"]
EXPOSE 3333 80
ENTRYPOINT ["./gophish"]
