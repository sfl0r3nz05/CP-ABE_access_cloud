FROM dreen/flask
MAINTAINER dreen
COPY ../verifier /verifier
WORKDIR /verifier/src
EXPOSE 5001
CMD [ "python","-u","app.py" ]