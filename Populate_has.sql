CREATE TABLE Has (
    PlantID			INTEGER,
    SightingID		INTEGER,
    PRIMARY KEY (PlantID, SightingID),
    FOREIGN KEY (PlantID, SightingID)
);