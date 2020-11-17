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

# Aggregation with having: find environments that have at least <input> number of plants
@app.route('/envMultiPlant')
def envAtLeastXPlants():
    numPlants = request.args.get('numPlants')
    enviroMoreThanQ =   f'WITH NumPlants AS ( ' \
                        f'SELECT p.environmentid, COUNT(plantid) AS plant_count FROM plant p ' \
                        f'GROUP BY p.environmentid HAVING COUNT(plantid) >= \'{numPlants}\' )' \
                        f'SELECT n.environmentid, e."Location", n.plant_count ' \
                        f'FROM NumPlants n, environment e '\
                        f'WHERE n.environmentid = e.environmentid ;'
    arrays['envMultiPlant'] = {}
    arrays['envMultiPlant']['res'] = connectAndQuery(enviroMoreThanQ)
    arrays['envMultiPlant']['cols'] = ['Environment ID', 'Location', 'Number of Plants']
    return render_template('GardenManager.html', arrays=arrays)

# Division query - find all dates where all of the environments were watered
@app.route('/division', methods=['GET'])
def division():
    divisionQ = '''WITH Waterings AS (
                    SELECT a.activityid, m.environmentid 
                    FROM activity a, maintains m
                    WHERE a.activityid = m.activityid AND a.activitytype = 'Water'
                ) SELECT a2."date" FROM activity a2
                    WHERE NOT EXISTS 
                      ((SELECT e.environmentid FROM environment e)
                        EXCEPT 
                        (SELECT w.environmentid FROM Waterings w
                         WHERE w.activityid = a2.activityid))
                    ORDER BY a2."date" ASC;'''
    arrays['division'] = {}
    arrays['division']['res'] = connectAndQuery(divisionQ)
    arrays['division']['cols'] = ['Date']
    return render_template('GardenManager.html', arrays=arrays)

# select query
@app.route('/pots')
def select_pots():
    op = request.args.get('op')
    radius = request.args.get('radius', None)
    colour = request.args.get('colour', None)
    if radius and colour:
        potsQ = f'select * from pot where "Radius" {op} {radius} and colour = \'{colour}\''
    else:
        potsQ = 'select * from pot'
    arrays['pots'] = {}
    arrays['pots']['cols'] = ['Environment ID', 'Colour', 'Radius', 'Height']
    arrays['pots']['res'] = connectAndQuery(potsQ)
    return render_template('GardenManager.html', arrays=arrays)

# join query
@app.route('/pestSighting')
def join_plant_has_pest():
    date = request.args.get('date', None)
    arrays['pestSighting'] = {}
    if date:
        arrays['pestSighting']['cols'] = ['Plant ID', 'Species', 'Pest Name']
        pestSightingQ = f'SELECT P.PlantID, P.Species, PS.PestName FROM Plant P, Has H, PestSighting PS WHERE P.PlantID = H.PlantID AND H.SightingID = PS.SightingID AND PS."Date" = \'{date}\''
    else:
        pestSightingQ = 'SELECT P.PlantID, P.Species, PS.PestName, ps."Date" FROM Plant P, Has H, PestSighting PS WHERE P.PlantID = H.PlantID AND H.SightingID = PS.SightingID'
        arrays['pestSighting']['cols'] = ['Plant ID', 'Species', 'Pest Name', 'Date']
    arrays['pestSighting']['res'] = connectAndQuery(pestSightingQ)
    return render_template('GardenManager.html', arrays=arrays)

@app.route('/plants_group_by')
def plants_group_by():
    plants_group_by = 'SELECT Species, COUNT(DISTINCT PlantID) From Plant GROUP BY Species'
    arrays['plants_group_by'] = {}
    arrays['plants_group_by']['cols'] = ['Species', 'Count']
    arrays['plants_group_by']['res'] = connectAndQuery(plants_group_by)
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
