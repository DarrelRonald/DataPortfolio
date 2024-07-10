FROM python:3.12.4-alpine3.20
RUN apk update && apk upgrade

WORKDIR /usr/src
COPY . /usr/src
VOLUME /usr/dockerdata/t1-duckdb

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
CMD [ "python", "./startscript.py" ]