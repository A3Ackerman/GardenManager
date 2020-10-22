-- Create tables for GardenManager

CREATE TABLE Activity (
	ActivityID		INTEGER,
	ActivityType	CHAR(50)	NOT NULL,
	Date			DATE,
	PRIMARY KEY (ActivityID)
);

CREATE TABLE PlantFamily ( 
	Genus			CHAR(30),
	PlantFamily 	CHAR(30),
	PRIMARY KEY (Genus)
);

CREATE TABLE Species (
	Genus			CHAR(30),
	Species			CHAR(30),
	CommonName		CHAR(40),
	LifeCycle		CHAR(10),
	PRIMARY KEY (Genus, Species),
	FOREIGN KEY (Genus) REFERENCES PlantFamily
);

CREATE TABLE Variety (
	Variety			CHAR(50),
	Genus			CHAR(30),
	Species			CHAR(30),
	PlantForm		CHAR(20),
	FrostTolerant	BOOLEAN,
	PRIMARY KEY (Variety, Genus, Species),
	FOREIGN KEY (Genus, Species) REFERENCES Species ON DELETE CASCADE
);

CREATE TABLE Environment( 
	EnvironmentID	INTEGER,
	"Location"		CHAR(30),
	PRIMARY KEY (EnvironmentID)
);

CREATE TABLE Pot ( 
	EnvironmentID	INTEGER, 
	Colour			CHAR(20),
	"Radius"		REAL,
	"Height"		REAL,
	PRIMARY KEY (EnvironmentID),
	FOREIGN KEY (EnvironmentID) REFERENCES Environment
);

CREATE TABLE Bed ( 
	EnvironmentID 	INTEGER,
	SurfaceArea		REAL,
	PRIMARY KEY (EnvironmentID),
	FOREIGN KEY (EnvironmentID) REFERENCES Environment
);

CREATE TABLE Plant (
	PlantID			INTEGER,
	Variety			CHAR(50),
	Genus			CHAR(30),
	Species			CHAR(30),
	Colour			CHAR(20),
	HealthStatus	CHAR(20),
	EnvironmentID	INTEGER,
	PRIMARY KEY (PlantID),
	FOREIGN KEY (Variety, Genus, Species) REFERENCES Variety,
	FOREIGN KEY	(EnvironmentID) REFERENCES Environment
);

CREATE TABLE Affects (
	PlantID			INTEGER,
	ActivityID		INTEGER,
	PRIMARY KEY (PlantID, ActivityID),
	FOREIGN KEY (PlantID) REFERENCES Plant,
	FOREIGN KEY (ActivityID) REFERENCES Activity
);

CREATE TABLE Maintains (
	ActivityID		INTEGER,
	EnvironmentID	INTEGER,
	PRIMARY KEY (ActivityID, EnvironmentID),
	FOREIGN KEY (EnvironmentID) REFERENCES Environment,
	FOREIGN KEY (ActivityID) REFERENCES Activity
);

CREATE TABLE Drainage ( 
	SoilType		CHAR(20),
	Drainage		CHAR(20),
	PRIMARY KEY (SoilType)
);

CREATE TABLE "Condition" (
	Sunlight 		CHAR(20),
	Nutrients		CHAR(30),
	SoilType		CHAR(20),
	Hydration		CHAR(20),
	PRIMARY KEY (Sunlight, Nutrients, SoilType, Hydration),
	FOREIGN KEY (SoilType) REFERENCES Drainage
);

CREATE TABLE Environment_Target (
	EnvironmentID	INTEGER,
	Sunlight 		CHAR(20),
	Nutrients		CHAR(30),
	SoilType		CHAR(20),
	Hydration		CHAR(20),
	PRIMARY KEY (EnvironmentID),
	FOREIGN KEY (EnvironmentID) REFERENCES Environment,
	FOREIGN KEY(Sunlight, Nutrients, SoilType, Hydration) REFERENCES "Condition"
);

CREATE TABLE Environment_CurrentlyHas (
	EnvironmentID	INTEGER,
	Sunlight 		CHAR(20),
	Nutrients		CHAR(30),
	SoilType		CHAR(20),
	Hydration		CHAR(20),
	PRIMARY KEY (EnvironmentID),
	FOREIGN KEY (EnvironmentID) REFERENCES Environment,
	FOREIGN KEY(Sunlight, Nutrients, SoilType, Hydration) REFERENCES "Condition"
);


CREATE TABLE Pest (
	PestName		CHAR(30),
	"Type"			CHAR(30),
	Description		CHAR(100),
	Control 		CHAR(100),
	PRIMARY KEY (PestName)
);

CREATE TABLE PestSighting (
	SightingID		INTEGER,
	PestName		CHAR(30),
	Severity		CHAR(20),
	"Date"			DATE,
	PlantID			INTEGER,
	PRIMARY KEY (SightingID),
	FOREIGN KEY (PestName) REFERENCES Pest,
	FOREIGN KEY (PlantID) REFERENCES Plant
);

CREATE TABLE IsSusceptibleTo ( 
	Variety			CHAR(50),
	Genus			CHAR(30),
	Species			CHAR(30),
	PestName		CHAR(30),
	PRIMARY KEY (Variety, Genus, Species, PestName),
	FOREIGN KEY (Variety, Genus, Species) REFERENCES Variety,
	FOREIGN KEY (PestName) REFERENCES Pest
);
