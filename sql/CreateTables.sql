-- Define enumerated data types
CREATE TYPE enum_SoilType AS ENUM ('Sandy','Clay','Silt','Loam','Peat','Chalky');
-- Here partial shade is shadier than partial sun
CREATE TYPE enum_Sunlight AS ENUM ('Full shade', 'Dappled sun', 'Partial shade', 'Partial sun', 'Full sun');
CREATE TYPE enum_Nutrients AS ENUM('Fertilized', 'Depleted');
CREATE TYPE enum_Hydration AS ENUM('Dry', 'Moist', 'Wet');
CREATE TYPE enum_Drainage AS ENUM('Good', 'Fair', 'Poor');

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
	DaysToMaturity	INTEGER,
	BloomPeriod		CHAR(30),
	PRIMARY KEY (Variety, Genus, Species),
	FOREIGN KEY (Genus, Species) REFERENCES Species
);

CREATE TABLE Environment ( 
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
		ON DELETE CASCADE 
);

CREATE TABLE Bed ( 
	EnvironmentID 	INTEGER,
	SurfaceArea		REAL,
	PRIMARY KEY (EnvironmentID),
	FOREIGN KEY (EnvironmentID) REFERENCES Environment 
		ON DELETE CASCADE
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
	FOREIGN KEY (EnvironmentID) REFERENCES Environment ON DELETE CASCADE
);

CREATE TABLE Affects (
	PlantID			INTEGER,
	ActivityID		INTEGER,
	PRIMARY KEY (PlantID, ActivityID),
	FOREIGN KEY (PlantID) REFERENCES Plant ON DELETE CASCADE,
	FOREIGN KEY (ActivityID) REFERENCES Activity ON DELETE CASCADE
);

CREATE TABLE Maintains (
	ActivityID		INTEGER,
	EnvironmentID	INTEGER,
	PRIMARY KEY (ActivityID, EnvironmentID),
	FOREIGN KEY (EnvironmentID) REFERENCES Environment ON DELETE CASCADE,
	FOREIGN KEY (ActivityID) REFERENCES Activity ON DELETE CASCADE
);

CREATE TABLE Drainage ( 
	SoilType		enum_SoilType,
	Drainage		enum_Drainage,
	PRIMARY KEY (SoilType)
);

CREATE TABLE "Condition" (
	Sunlight 		enum_Sunlight,
	Nutrients		enum_Nutrients,
	SoilType		enum_SoilType,
	Hydration		enum_Hydration,
	PRIMARY KEY (Sunlight, Nutrients, SoilType, Hydration),
	FOREIGN KEY (SoilType) REFERENCES Drainage ON DELETE CASCADE
);

CREATE TABLE Environment_Target (
	EnvironmentID	INTEGER,
	Sunlight 		enum_Sunlight,
	Nutrients		enum_Nutrients,
	SoilType		enum_SoilType,
	Hydration		enum_Hydration,
	PRIMARY KEY (EnvironmentID),
	FOREIGN KEY (EnvironmentID) REFERENCES Environment ON DELETE CASCADE,
	FOREIGN KEY(Sunlight, Nutrients, SoilType, Hydration) REFERENCES "Condition"
);

CREATE TABLE Environment_CurrentlyHas (
	EnvironmentID	INTEGER,
	Sunlight 		enum_Sunlight,
	Nutrients		enum_Nutrients,
	SoilType		enum_SoilType,
	Hydration		enum_Hydration,
	PRIMARY KEY (EnvironmentID),
	FOREIGN KEY (EnvironmentID) REFERENCES Environment ON DELETE CASCADE,
	FOREIGN KEY(Sunlight, Nutrients, SoilType, Hydration) REFERENCES "Condition"
);


CREATE TABLE Pest (
	PestName		CHAR(30),
	"Type"			CHAR(30),
	Description		CHAR(210),
	Control 		CHAR(200),
	PRIMARY KEY (PestName)
);


CREATE TABLE PestSighting (
	SightingID		INTEGER,
	PestName		CHAR(30),
	Severity		CHAR(20),
	"Date"			DATE,
	PRIMARY KEY (SightingID),
	FOREIGN KEY (PestName) REFERENCES Pest 
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

CREATE TABLE ThrivesIn (
Variety			CHAR(50),
	Genus			CHAR(30),
	Species			CHAR(30),
	Sunlight 		enum_Sunlight,
	Nutrients		enum_Nutrients,
	SoilType		enum_SoilType,
	Hydration		enum_Hydration,
	PRIMARY KEY (Variety, Genus, Species, Sunlight, Nutrients, SoilType, Hydration),
	FOREIGN KEY (Variety, Genus, Species) REFERENCES Variety,
FOREIGN KEY(Sunlight, Nutrients, SoilType, Hydration) REFERENCES "Condition"
);

CREATE TABLE Has (
	PlantID			INTEGER,
	SightingID		INTEGER,
	PRIMARY KEY (PlantID, SightingID),
	FOREIGN KEY (PlantID) REFERENCES Plant  ON DELETE CASCADE, 
	FOREIGN KEY (SightingID) REFERENCES PestSighting  ON DELETE CASCADE
);



