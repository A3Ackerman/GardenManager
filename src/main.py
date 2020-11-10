from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__, template_folder="")


@app.route('/', methods=['GET'])
def hello():
    return render_template("GardenManager.html")


if __name__ == '__main__':
    app.run()
