from flask import Flask, render_template, request
import psycopg2

user = 'GardenManager'
pw = 'gardenManager'
url = 'localhost'
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
    arrays['sampleQ']['cols'] = ['plantid', 'variety', 'genus', 'species', 'colour', 'healthstatus', 'environmentid']
    return render_template('GardenManager.html', arrays=arrays)


@app.route('/species', methods=['GET', 'POST'])
def insertSpecies():
    if request.method == 'POST':
        # do insert things
        return render_template('GardenManager.html', arrays=arrays)
    else:
        selectQ = 'Select * from species;'
        arrays['species'] = {}
        arrays['species']['res'] = connectAndQuery(selectQ)
        arrays['species']['cols'] = ['']
        return render_template('GardenManager.html', arrays=arrays)


@app.route('/project')
def project():
    plantID = request.args.get("plantID")
    projectQ = f'SELECT Variety, Genus, Species, EnvironmentID FROM Plant WHERE PlantID = {plantID};'
    arrays['project'] = {}
    arrays['project']['res'] = connectAndQuery(projectQ)
    arrays['project']['cols'] = ["variety", "genus", "species", "environmentID"]
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
