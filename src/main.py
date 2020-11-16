from flask import Flask, render_template, request
import psycopg2

user = 'GardenManager'
pw = 'gardenManager'
url = 'localhost'
db = 'GardenManager'

app = Flask(__name__, template_folder='')
app.static_folder = 'static'

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

@app.route('/deletePlant', methods=['GET', 'POST'])
def deletePlant():
    if request.method == 'POST':
        plantIDtoDelete = request.form["plantID"]
        deletePlantQ = f'DELETE FROM plant WHERE plantid={plantIDtoDelete};'
        connectAndQuery(deletePlantQ, False)
        return render_template('GardenManager.html', arrays=arrays)
    else:
        return showPlantTable()


@app.route('/plant', methods=['GET', 'POST'])
def plant():
    #we run into some issues here with deleting from the plant table.
    # also just found out that forms only work with get and post requests
    if request.method == 'POST':
        sql = request.form['sql']
        if sql == "deletePlant":
            plantIDtoDelete = request.form["plantID"]
            deletePlantQ = f'DELETE FROM plant WHERE plantid={plantIDtoDelete};'
            connectAndQuery(deletePlantQ, False)
            return render_template('GardenManager.html', arrays=arrays)
        elif sql == "updatePlant":
            plantID = request.form["plantID"]
            healthStatus = request.form["healthStatus"]
            updatePlantQ = f'UPDATE Plant SET HealthStatus = \'{healthStatus}\' WHERE PlantID = {plantID};'
            connectAndQuery(updatePlantQ, False)
            return render_template('GardenManager.html', arrays=arrays)
    else:
        return showPlantTable()


def showPlantTable():
    selectPlants = 'Select * from plant order by plantid;'
    arrays['plant'] = {}
    arrays['plant']['res'] = connectAndQuery(selectPlants)
    arrays['plant']['cols'] = ['Plant ID', 'Variety', 'Genus', 'Species', 'Colour', 'Health Status', 'Environment ID']
    return render_template('GardenManager.html', arrays=arrays)

# Aggregation with Having query
@app.route('/envMultiPlant')
def envAtLeastXPlants():
    numPlants = request.args.get('numPlants')
    enviroMoreThanQ =   f'WITH NumPlants AS (' \
                        f' SELECT p.environmentid, COUNT(plantid) AS plant_count FROM plant p ' \
                        f'GROUP BY p.environmentid HAVING COUNT(plantid) >= \'{numPlants}\' )' \
                        f'SELECT n.environmentid, e."Location", n.plant_count ' \
                        f'FROM NumPlants n, environment e '\
                        f'WHERE n.environmentid = e.environmentid ;'
    arrays['envMultiPlant'] = {}
    arrays['envMultiPlant']['res'] = connectAndQuery(enviroMoreThanQ)
    arrays['envMultiPlant']['cols'] = ['Environment ID', 'Location', 'Number of Plants']
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
