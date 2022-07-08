FROM dreen/flask
COPY src/ .
CMD [ "python","-u","app.py" ]