## Super rough outline of the tables we may or may not need lol, TBD

CREATE TABLE Activity (
	ActivityID		INTEGER,
	ActivityType	CHAR(50)	NOT NULL,
	EnvironmentID	INTEGER,
	Date			DATE,
	PRIMARY KEY (ActivityID)
	FOREIGN KEY (EnvironmentID) REFERENCES Environment
)

CREATE TABLE Plant (
	PlantID			INTEGER,
	Variety			CHAR(50)
	Colour			CHAR(20),
	HealthStatus	CHAR(20),
	PRIMARY KEY (PlantID)
	FOREIGN KEY (Variety) REFERENCES Variety
)

CREATE TABLE Species (
	Genus			CHAR(30),
	Species			CHAR(30),
	PlantFamily		CHAR(20),
	CommonName		CHAR(40),
	LifeCycle		CHAR(10),
	PRIMARY KEY (Genus, Species)
)

CREATE TABLE Variety (
	Variety			CHAR(50),
	Genus			CHAR(30),
	Species			CHAR(30),
	PlantForm		CHAR(20),
	FrostTolerant	BOOLEAN,
	PRIMARY KEY (Variety, Genus, Species),
	FOREIGN KEY (Genus, Species) REFERENCES Species ON DELETE CASCADE
)

# should ideal conditions be their own table? since Variety can have multiple ideal conditions
CREATE TABLE IdealConditions (
	Variety			CHAR(50),
	Sunlight 		CHAR(20),
	Drainage		CHAR(20),
	Nutrients		CHAR(30),
	SoilType		CHAR(20),
	Hydration		CHAR(20)
	FOREIGN KEY (Variety) REFERENCES Variety,
	FOREIGN KEY(Sunlight, Drainage, Nutrients, SoilType, Hydration) REFERENCES Condition
)

CREATE TABLE Environment (
	EnvironmentID	INTEGER,
	Location		CHAR(30),
	CurrSunlight	CHAR(20),
	CurrDrainage	CHAR(20),
	CurrNutrients	CHAR(30),
	CurrSoilType
	PRIMARY KEY (EnvironmentID)
)

# how to show create subtypes??
CREATE TABLE Pot (

	
	PRIMARY KEY ()
)


CREATE TABLE Condition (
	Sunlight 		CHAR(20),
	Drainage		CHAR(20),
	Nutrients		CHAR(30),
	SoilType		CHAR(20),
	Hydration		CHAR(20)
	PRIMARY KEY (Sunlight, Drainage, Nutrients, SoilType, Hydration)
)

CREATE TABLE Pest (
	PestName		CHAR(30),
	PestType		CHAR(30),
	Description		CHAR(100),
	Control 		CHAR(100),
	PRIMARY KEY (PestName),
)

CREATE TABLE ( PestSighting
	SightingID		INTEGER,
	PestName		CHAR(30),
	Severity		CHAR(20),
	"Date"			DATE,
	PRIMARY KEY (SightingID),
	FOREIGN KEY (PestName) REFERENCES Pest
)

