from flask import Flask
import pycpabe
#from ABE.samples import main

app = Flask(__name__)
@app.route("/")
def home():
    pycpabe.cpabe_setup("./pk","./mk")
    return "Testing"

if __name__ == '__main__':
    app.run(host='0.0.0.0')