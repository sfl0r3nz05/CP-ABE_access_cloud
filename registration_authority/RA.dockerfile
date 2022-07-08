FROM dreen/flask
MAINTAINER dreen
COPY ../registration_authority /registration_authority
WORKDIR /registration_authority/src
EXPOSE 5002
CMD [ "python","-u","app.py" ]