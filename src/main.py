from flask import Flask, render_template, request
import psycopg2

user = 'GardenManager'
pw = 'gardenManager'
url = 'localhost'
db = 'GardenManager'

app = Flask(__name__, template_folder='')

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


@app.route('/deletePlant', methods=['GET', 'POST'])
def deletePlant():
    if request.method == 'POST':
        plantIDtoDelete = request.args.get("plantID")
        deletePlantQ = 'DELETE FROM plant WHERE plantid='+ plantIDtoDelete +';'
        arrays['delPlant'] = {}
        arrays['delPlant']['plantid'] = connectAndQuery(selectQ)
        return render_template('GardenManager.html', arrays=arrays)
    else:
        selectPlants = 'Select * from plant order by plantid;'
        arrays['plant'] = {}
        arrays['plant']['res'] = connectAndQuery(selectPlants)
        arrays['plant']['cols'] = ['Plant ID', 'Variety', 'Genus', 'Species', 'Colour', 'Health Status', 'Environment ID']
        return render_template('GardenManager.html', arrays=arrays)


@app.route('/pest', methods=['GET', 'POST'])
def insertPest():
    if request.method == 'POST':
        pestName = request.form['pestName']
        tpe = request.form['type']
        desc = request.form['description']
        control = request.form['control']
        insertQ = f'Insert Into Pest Values (\'{pestName}\', \'{tpe}\', \'{desc}\', \'{control}\');'
        connectAndQuery(insertQ, False)
        return render_template('GardenManager.html', arrays=arrays)
    else:
        selectQ = 'Select * from pest;'
        arrays['pest'] = {}
        arrays['pest']['res'] = connectAndQuery(selectQ)
        arrays['pest']['cols'] = ['Pest Name', 'Type', 'Description', 'Control']
        return render_template('GardenManager.html', arrays=arrays)


@app.route('/project')
def project():
    plantID = request.args.get('plantID')
    projectQ = f'SELECT Variety, Genus, Species, EnvironmentID FROM Plant WHERE PlantID = {plantID};'
    arrays['project'] = {}
    arrays['project']['res'] = connectAndQuery(projectQ)
    arrays['project']['cols'] = ['variety', 'genus', 'species', 'environmentID']
    return render_template('GardenManager.html', arrays=arrays)


def connectAndQuery(sql, fetch=True):
    conn = psycopg2.connect(f'dbname={db} user={user} password={pw} host={url}')
    cur = conn.cursor()
    cur.execute(sql)
    if fetch:
        res = cur.fetchall()
    else:
        res = None
    conn.commit()
    cur.close()
    conn.close()
    return res


if __name__ == '__main__':
    arrays = {}
    app.run(debug=True)
