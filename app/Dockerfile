FROM python:3.7

RUN apt-get update -y && \
  apt-get install -y python3-pip python3-dev

WORKDIR /app

RUN pip install Flask requests flask_mysqldb && \
  pip install --upgrade pip && \ 
  pip install chatterbot && \
  pip install spacy

COPY . .


EXPOSE 8080

CMD ["python", "app.py"]