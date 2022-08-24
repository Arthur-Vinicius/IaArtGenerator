FROM python:3.7

RUN apt-get update -y && \
  apt-get install -y python3-pip python3-dev && \
  pip3 install --upgrade pip 

WORKDIR /app

COPY requirements.txt requirements.txt
  
RUN pip3 install -r requirements.txt && \
  #pip3 install Flask requests flask_mysqldb && \
  pip3 install chatterbot && \
  pip3 install spacy

COPY . /app

EXPOSE 8080

CMD ["python", "manage.py", "runserver","0.0.0.0.:8000"]

# pip install Django==3.2.7

# django-admin startproject project .

# python manage.py startapp app

#
