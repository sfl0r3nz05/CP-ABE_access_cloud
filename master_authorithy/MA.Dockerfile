FROM dreen/flask
MAINTAINER dreen
COPY ../master_authority /master_authority
WORKDIR /master_authority/src
EXPOSE 5000
CMD [ "python","-u","app.py" ]