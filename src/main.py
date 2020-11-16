from flask import Flask, render_template, request
import psycopg2

user = 'GardenManager'
pw = 'gardenManager'
url = '0.0.0.0'
db = 'GardenManager'

app = Flask(__name__, template_folder="")

global arrays


@app.route('/', methods=['GET'])
def index():
    return render_template('GardenManager.html', arrays=arrays)


@app.route('/sampleQ', methods=['GET'])
def sampleQuery():
    selectQ = 'Select * from plant;'
    arrays['sampleQ'] = {}
    arrays['sampleQ']['res'] = connectAndQuery(selectQ)
    colsQ = "select column_name from information_schema.columns where table_name = 'plant';"
    arrays['sampleQ']['cols'] = ['plantid','variety','genus','species','colour','healthstatus','environmentid']
    return render_template('GardenManager.html', arrays=arrays)

@app.route('/insert', methods=['POST'])
def insert():
    # do things to insert
    return render_template('GardenManager.html', arrays=arrays)



def connectAndQuery(sql):
    conn = psycopg2.connect(f'dbname={db} user={user} password={pw} host={url}')
    cur = conn.cursor()
    cur.execute(sql)
    res = cur.fetchall()
    conn.commit()
    cur.close()
    conn.close()
    return res


if __name__ == '__main__':
    arrays = {}
    app.run(debug=True)
