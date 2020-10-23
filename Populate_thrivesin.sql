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

INSERT INTO "GardenManager".ThrivesIn (Variety, Genus, Species, Sunlight, Nutrients, SoilType, Hydration) VALUES
(),(),(),(),();


