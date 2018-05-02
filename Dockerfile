from ubuntu:bionic

RUN apt-get update && apt-get upgrade -y && apt-get install -y bibutils vim less 

COPY bib2word.sh /usr/local/bin/bib2word
RUN chmod +x /usr/local/bin/bib2word

RUN mkdir /app
WORKDIR /app 

ENTRYPOINT ["bib2word"]