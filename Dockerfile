FROM python:3

## instalar dependencias e programas que seram nescessarios para o sistema.
RUN apt-get update -y && \
  apt-get install -y python3-pip python3-dev

WORKDIR /app

COPY . .

## instalar bibliotecas que seram nescessarias para a execução e desenvolvimento do app
RUN pip install Flask requests flask_mysqldb

EXPOSE 5000
