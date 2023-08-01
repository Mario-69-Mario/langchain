FROM python:3.8

# set the working directory
WORKDIR /app

# install dependencies
COPY ./requirements.txt /app
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install --no-cache-dir --upgrade -r requirements.txt --target=/app/appRequirements
ENV PYTHONPATH=/app/appRequirements

RUN pip install langchain
#RUN apt-get update && apt-get -y install cron
RUN apt-get update && apt-get -y install nano

# copy the scripts to the folder
COPY . /app
COPY ./UI/* /app/ui

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

VOLUME /shared/data


