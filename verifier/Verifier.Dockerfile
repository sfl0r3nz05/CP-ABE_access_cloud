FROM dreen/flask
#https://github.com/redis/redis-py
COPY /src .
CMD [ "python","-u","app.py" ]