from flask import Flask, render_template, request
from sqlalchemy.sql import select
from sqlalchemy import create_engine, Table

user = 'GardenManager'
pw = 'gardenManager'
url = '0.0.0.0'
db = 'GardenManager'

app = Flask(__name__, template_folder="")
app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://{user}:{pw}@{url}/{db}'
db = create_engine(f'postgresql://{user}:{pw}@{url}/{db}')


@app.route('/', methods=['GET', 'POST'])
def hello():
    display = False
    if request.method == 'POST':
        display = True

        """
        NOT WORKING yet... 
        with db.connect() as conn:
            plant = Table('plant', {'mysql_engine':'PostgreSQL'})
            query = select([plant])
        for row in conn.execute(query):
            print(row)
        """

    return render_template('GardenManager.html', query1=display)


@app.route('/button1')
def button1():
    return render_template('GardenManager.html', query1=True)


if __name__ == '__main__':
    app.run(debug=True)
