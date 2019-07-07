from python:3.7.1

RUN apt-get install -y git 

RUN mkdir /root/safaribooks && mkdir /downloads

WORKDIR /root/safaribooks

ADD Pipfile Pipfile.lock README.md requirements.txt safaribooks.py /root/safaribooks/


RUN cd /root/safaribooks && pip3 install -r requirements.txt

RUN cd /root/safaribooks && python3 safaribooks.py --help

ADD download /usr/local/bin 

RUN chmod +x /usr/local/bin/download && ls -la /usr/local/bin/download

WORKDIR /downloads

ENTRYPOINT ["download"]

CMD ["bookid"]


