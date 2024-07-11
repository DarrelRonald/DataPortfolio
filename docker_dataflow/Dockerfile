FROM python:3.12.4-slim

RUN apt-get -y update && apt-get -y upgrade

WORKDIR /usr/dataflow
COPY ./ ./

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/bin/bash", "-c"]