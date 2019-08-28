FROM python:3.6.2
LABEL maintainer fableguo
ENV PYTHONUNBUFFERED 1

RUN mkdir /docker_api
WORKDIR /docker_api
COPY Dockerfile /docker_api/
COPY requirements.txt /docker_api/

RUN pip3 install -r requirements.txt
#RUN pip3 install django<2.0 psycopg2 djangorestframework==3.8.1 djongo django_mongodb_engine

RUN apt-get update
RUN apt-get install -y git
RUN git clone https://guofable@bitbucket.org/guofable/django_chat.git

CMD echo "start git download"
CMD git pull
CMD echo "end git download"

CMD sudo echo "192.168.99.106  mongo1" >> /etc/hosts
CMD sudo echo "192.168.99.107  mongo2" >> /etc/hosts
CMD sudo echo "192.168.99.108  mongo3" >> /etc/hosts

CMD python3 django_chat/manage.py runserver 0.0.0.0:8000