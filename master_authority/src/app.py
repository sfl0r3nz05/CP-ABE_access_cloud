from flask import Flask
from ABE.samples import main

app = Flask(__name__)

@app.route("/")
def home():

    return "Testing"

if __name__ == '__main__':
    app.run(host='0.0.0.0')