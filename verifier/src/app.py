from flask import Flask
import redis

app = Flask(__name__)

@app.route("/")
def home():
    r.get('foo')
    return "testing"


if __name__ == '__main__':
    app.run(host='0.0.0.0')