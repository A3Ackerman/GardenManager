from flask import Flask, render_template, request
import psycopg2

user = 'GardenManager'
pw = 'gardenManager'
url = '0.0.0.0'
db = 'GardenManager'

app = Flask(__name__, template_folder="")


@app.route('/', methods=['GET', 'POST'])
def hello():
    display = False
    if request.method == 'POST':
        display = True
        connectAndSelect()
    return render_template('GardenManager.html', query1=display)


@app.route('/button1')
def button1():
    return render_template('GardenManager.html', query1=True)


def connectAndSelect():
    conn = psycopg2.connect(f'dbname={db} user={user} password={pw} host={url}')
    cur = conn.cursor()
    cur.execute("Select plantID from plant;")
    print(cur.fetchall())
    conn.commit()
    cur.close()
    conn.close()


if __name__ == '__main__':
    app.run(debug=True)
