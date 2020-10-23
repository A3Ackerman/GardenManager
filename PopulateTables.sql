-- Plant family
INSERT INTO "GardenManager".plantfamily (genus,plantfamily) VALUES
	 ('Allium','Alliaceae'),
	 ('Beta','Chenopodiaceae'),
	 ('Brassica','Brassicaceae'),
	 ('Capsicum','Solanaceae'),
	 ('Convallaria','Convallariaceae'),
	 ('Cucumis','Cucurbitaceae'),
	 ('Daucus','Apiaceae'),
	 ('Fragaria','Rosaceae'),
	 ('Lactuca','Asteraceae'),
	 ('Lavendula','Lamiaceae');
INSERT INTO "GardenManager".plantfamily (genus,plantfamily) VALUES
	 ('Mentha','Lamiaceae'),
	 ('Metha','Lamiaceae'),
	 ('Phaseolus','Leguminosae'),
	 ('Pisum','Fabaceae'),
	 ('Rheum','Polygonaceae'),
	 ('Solanum','Solanaceae'),
	 ('Spinacia','Chenopodiaceae'),
	 ('Zea','Gramineae');
	 
-- Species
INSERT INTO "GardenManager".species (genus,species,commonname,lifecycle) VALUES
	 ('Solanum','lycopersicum','Tomato','Annual'),
	 ('Convallaria','majalis','Lily-of-the-Valley','Perennial'),
	 ('Lavendula','angustifolia','Lavender','Perennial'),
	 ('Lactuca','sativa','Lettuce','Annual'),
	 ('Cucumis','sativa','Cucumber','Annual'),
	 ('Pisum','sativum','Pea','Annual'),
	 ('Phaseolus','vulgaris','Bean','Annual'),
	 ('Daucus','carota','Carrot','Biennial'),
	 ('Allium','sativum','Garlic','Annual'),
	 ('Allium','cepa','Onion','Annual');
INSERT INTO "GardenManager".species (genus,species,commonname,lifecycle) VALUES
	 ('Fragaria','vesca','Strawberry','Perennial'),
	 ('Beta','vulgaris','Beet','Annual'),
	 ('Capsicum','annuum','Capsicum','Annual'),
	 ('Rheum','rhabarbarum','Rhubarb','Perennial'),
	 ('Brassica','oleracea','Cabbage','Annual'),
	 ('Zea','mays','Corn','Annual'),
	 ('Spinacia','oleracea','Spinach','Annual'),
	 ('Mentha','spicata','Spearmint','Perennial'),
	 ('Metha','x piperata','Peppermint','Perennial');

-- Variety
INSERT INTO "GardenManager".variety (variety,genus,species,plantform,frosttolerant) VALUES
	 ('Prizehead','Lactuca','sativa','leaf vegetable',false),
	 ('Scarlet nantes','Daucus','carota','root vegetable',false),
	 ('Detroit dark red','Beta','vulgaris','root vegetable',true),
	 ('Kale green curled','Brassica','oleracea','leaf vegetable',true),
	 ('Cabbage red express','Brassica','oleracea','leaf vegetable',true),
	 ('Broccoli','Brassica','oleracea','leaf vegetable',true),
	 ('Brussels sprouts','Brassica','oleracea','leaf vegetable',true),
	 ('Kale lacinato','Brassica','oleracea','leaf vegetable',true),
	 ('Canadian early supersweet hybrid corn','Zea','mays','vegetable',false),
	 ('Glaskin''s Perpetual Rhubarb','Rheum','rhabarbarum','stalks vegetable',true);
INSERT INTO "GardenManager".variety (variety,genus,species,plantform,frosttolerant) VALUES
	 ('Fresca strawberries','Fragaria','vesca','sprawling fruit',true),
	 ('Spearmint','Mentha','spicata','herb',true),
	 ('Peppermint','Metha','x piperata','herb',true);

-- Drainage
INSERT INTO "GardenManager".drainage (soiltype,drainage) VALUES
	 ('Sandy','Good'),
	 ('Clay','Poor'),
	 ('Silt','Fair'),
	 ('Loam','Fair'),
	 ('Peat','Poor'),
	 ('Chalky','Good');

-- Condition 
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Full shade','Fertilized','Sandy','Dry'),
	 ('Full shade','Fertilized','Sandy','Moist'),
	 ('Full shade','Fertilized','Sandy','Wet'),
	 ('Full shade','Fertilized','Clay','Dry'),
	 ('Full shade','Fertilized','Clay','Moist'),
	 ('Full shade','Fertilized','Clay','Wet'),
	 ('Full shade','Fertilized','Silt','Dry'),
	 ('Full shade','Fertilized','Silt','Moist'),
	 ('Full shade','Fertilized','Silt','Wet'),
	 ('Full shade','Fertilized','Loam','Dry');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Full shade','Fertilized','Loam','Moist'),
	 ('Full shade','Fertilized','Loam','Wet'),
	 ('Full shade','Fertilized','Peat','Dry'),
	 ('Full shade','Fertilized','Peat','Moist'),
	 ('Full shade','Fertilized','Peat','Wet'),
	 ('Full shade','Fertilized','Chalky','Dry'),
	 ('Full shade','Fertilized','Chalky','Moist'),
	 ('Full shade','Fertilized','Chalky','Wet'),
	 ('Full shade','Depleted','Sandy','Dry'),
	 ('Full shade','Depleted','Sandy','Moist');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Full shade','Depleted','Sandy','Wet'),
	 ('Full shade','Depleted','Clay','Dry'),
	 ('Full shade','Depleted','Clay','Moist'),
	 ('Full shade','Depleted','Clay','Wet'),
	 ('Full shade','Depleted','Silt','Dry'),
	 ('Full shade','Depleted','Silt','Moist'),
	 ('Full shade','Depleted','Silt','Wet'),
	 ('Full shade','Depleted','Loam','Dry'),
	 ('Full shade','Depleted','Loam','Moist'),
	 ('Full shade','Depleted','Loam','Wet');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Full shade','Depleted','Peat','Dry'),
	 ('Full shade','Depleted','Peat','Moist'),
	 ('Full shade','Depleted','Peat','Wet'),
	 ('Full shade','Depleted','Chalky','Dry'),
	 ('Full shade','Depleted','Chalky','Moist'),
	 ('Full shade','Depleted','Chalky','Wet'),
	 ('Dappled sun','Fertilized','Sandy','Dry'),
	 ('Dappled sun','Fertilized','Sandy','Moist'),
	 ('Dappled sun','Fertilized','Sandy','Wet'),
	 ('Dappled sun','Fertilized','Clay','Dry');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Dappled sun','Fertilized','Clay','Moist'),
	 ('Dappled sun','Fertilized','Clay','Wet'),
	 ('Dappled sun','Fertilized','Silt','Dry'),
	 ('Dappled sun','Fertilized','Silt','Moist'),
	 ('Dappled sun','Fertilized','Silt','Wet'),
	 ('Dappled sun','Fertilized','Loam','Dry'),
	 ('Dappled sun','Fertilized','Loam','Moist'),
	 ('Dappled sun','Fertilized','Loam','Wet'),
	 ('Dappled sun','Fertilized','Peat','Dry'),
	 ('Dappled sun','Fertilized','Peat','Moist');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Dappled sun','Fertilized','Peat','Wet'),
	 ('Dappled sun','Fertilized','Chalky','Dry'),
	 ('Dappled sun','Fertilized','Chalky','Moist'),
	 ('Dappled sun','Fertilized','Chalky','Wet'),
	 ('Dappled sun','Depleted','Sandy','Dry'),
	 ('Dappled sun','Depleted','Sandy','Moist'),
	 ('Dappled sun','Depleted','Sandy','Wet'),
	 ('Dappled sun','Depleted','Clay','Dry'),
	 ('Dappled sun','Depleted','Clay','Moist'),
	 ('Dappled sun','Depleted','Clay','Wet');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Dappled sun','Depleted','Silt','Dry'),
	 ('Dappled sun','Depleted','Silt','Moist'),
	 ('Dappled sun','Depleted','Silt','Wet'),
	 ('Dappled sun','Depleted','Loam','Dry'),
	 ('Dappled sun','Depleted','Loam','Moist'),
	 ('Dappled sun','Depleted','Loam','Wet'),
	 ('Dappled sun','Depleted','Peat','Dry'),
	 ('Dappled sun','Depleted','Peat','Moist'),
	 ('Dappled sun','Depleted','Peat','Wet'),
	 ('Dappled sun','Depleted','Chalky','Dry');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Dappled sun','Depleted','Chalky','Moist'),
	 ('Dappled sun','Depleted','Chalky','Wet'),
	 ('Partial shade','Fertilized','Sandy','Dry'),
	 ('Partial shade','Fertilized','Sandy','Moist'),
	 ('Partial shade','Fertilized','Sandy','Wet'),
	 ('Partial shade','Fertilized','Clay','Dry'),
	 ('Partial shade','Fertilized','Clay','Moist'),
	 ('Partial shade','Fertilized','Clay','Wet'),
	 ('Partial shade','Fertilized','Silt','Dry'),
	 ('Partial shade','Fertilized','Silt','Moist');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Partial shade','Fertilized','Silt','Wet'),
	 ('Partial shade','Fertilized','Loam','Dry'),
	 ('Partial shade','Fertilized','Loam','Moist'),
	 ('Partial shade','Fertilized','Loam','Wet'),
	 ('Partial shade','Fertilized','Peat','Dry'),
	 ('Partial shade','Fertilized','Peat','Moist'),
	 ('Partial shade','Fertilized','Peat','Wet'),
	 ('Partial shade','Fertilized','Chalky','Dry'),
	 ('Partial shade','Fertilized','Chalky','Moist'),
	 ('Partial shade','Fertilized','Chalky','Wet');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Partial shade','Depleted','Sandy','Dry'),
	 ('Partial shade','Depleted','Sandy','Moist'),
	 ('Partial shade','Depleted','Sandy','Wet'),
	 ('Partial shade','Depleted','Clay','Dry'),
	 ('Partial shade','Depleted','Clay','Moist'),
	 ('Partial shade','Depleted','Clay','Wet'),
	 ('Partial shade','Depleted','Silt','Dry'),
	 ('Partial shade','Depleted','Silt','Moist'),
	 ('Partial shade','Depleted','Silt','Wet'),
	 ('Partial shade','Depleted','Loam','Dry');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Partial shade','Depleted','Loam','Moist'),
	 ('Partial shade','Depleted','Loam','Wet'),
	 ('Partial shade','Depleted','Peat','Dry'),
	 ('Partial shade','Depleted','Peat','Moist'),
	 ('Partial shade','Depleted','Peat','Wet'),
	 ('Partial shade','Depleted','Chalky','Dry'),
	 ('Partial shade','Depleted','Chalky','Moist'),
	 ('Partial shade','Depleted','Chalky','Wet'),
	 ('Partial sun','Fertilized','Sandy','Dry'),
	 ('Partial sun','Fertilized','Sandy','Moist');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Partial sun','Fertilized','Sandy','Wet'),
	 ('Partial sun','Fertilized','Clay','Dry'),
	 ('Partial sun','Fertilized','Clay','Moist'),
	 ('Partial sun','Fertilized','Clay','Wet'),
	 ('Partial sun','Fertilized','Silt','Dry'),
	 ('Partial sun','Fertilized','Silt','Moist'),
	 ('Partial sun','Fertilized','Silt','Wet'),
	 ('Partial sun','Fertilized','Loam','Dry'),
	 ('Partial sun','Fertilized','Loam','Moist'),
	 ('Partial sun','Fertilized','Loam','Wet');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Partial sun','Fertilized','Peat','Dry'),
	 ('Partial sun','Fertilized','Peat','Moist'),
	 ('Partial sun','Fertilized','Peat','Wet'),
	 ('Partial sun','Fertilized','Chalky','Dry'),
	 ('Partial sun','Fertilized','Chalky','Moist'),
	 ('Partial sun','Fertilized','Chalky','Wet'),
	 ('Partial sun','Depleted','Sandy','Dry'),
	 ('Partial sun','Depleted','Sandy','Moist'),
	 ('Partial sun','Depleted','Sandy','Wet'),
	 ('Partial sun','Depleted','Clay','Dry');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Partial sun','Depleted','Clay','Moist'),
	 ('Partial sun','Depleted','Clay','Wet'),
	 ('Partial sun','Depleted','Silt','Dry'),
	 ('Partial sun','Depleted','Silt','Moist'),
	 ('Partial sun','Depleted','Silt','Wet'),
	 ('Partial sun','Depleted','Loam','Dry'),
	 ('Partial sun','Depleted','Loam','Moist'),
	 ('Partial sun','Depleted','Loam','Wet'),
	 ('Partial sun','Depleted','Peat','Dry'),
	 ('Partial sun','Depleted','Peat','Moist');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Partial sun','Depleted','Peat','Wet'),
	 ('Partial sun','Depleted','Chalky','Dry'),
	 ('Partial sun','Depleted','Chalky','Moist'),
	 ('Partial sun','Depleted','Chalky','Wet'),
	 ('Full sun','Fertilized','Sandy','Dry'),
	 ('Full sun','Fertilized','Sandy','Moist'),
	 ('Full sun','Fertilized','Sandy','Wet'),
	 ('Full sun','Fertilized','Clay','Dry'),
	 ('Full sun','Fertilized','Clay','Moist'),
	 ('Full sun','Fertilized','Clay','Wet');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Full sun','Fertilized','Silt','Dry'),
	 ('Full sun','Fertilized','Silt','Moist'),
	 ('Full sun','Fertilized','Silt','Wet'),
	 ('Full sun','Fertilized','Loam','Dry'),
	 ('Full sun','Fertilized','Loam','Moist'),
	 ('Full sun','Fertilized','Loam','Wet'),
	 ('Full sun','Fertilized','Peat','Dry'),
	 ('Full sun','Fertilized','Peat','Moist'),
	 ('Full sun','Fertilized','Peat','Wet'),
	 ('Full sun','Fertilized','Chalky','Dry');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Full sun','Fertilized','Chalky','Moist'),
	 ('Full sun','Fertilized','Chalky','Wet'),
	 ('Full sun','Depleted','Sandy','Dry'),
	 ('Full sun','Depleted','Sandy','Moist'),
	 ('Full sun','Depleted','Sandy','Wet'),
	 ('Full sun','Depleted','Clay','Dry'),
	 ('Full sun','Depleted','Clay','Moist'),
	 ('Full sun','Depleted','Clay','Wet'),
	 ('Full sun','Depleted','Silt','Dry'),
	 ('Full sun','Depleted','Silt','Moist');
INSERT INTO "GardenManager"."Condition" (sunlight,nutrients,soiltype,hydration) VALUES
	 ('Full sun','Depleted','Silt','Wet'),
	 ('Full sun','Depleted','Loam','Dry'),
	 ('Full sun','Depleted','Loam','Moist'),
	 ('Full sun','Depleted','Loam','Wet'),
	 ('Full sun','Depleted','Peat','Dry'),
	 ('Full sun','Depleted','Peat','Moist'),
	 ('Full sun','Depleted','Peat','Wet'),
	 ('Full sun','Depleted','Chalky','Dry'),
	 ('Full sun','Depleted','Chalky','Moist'),
	 ('Full sun','Depleted','Chalky','Wet');

-- Environment
INSERT INTO "GardenManager".environment (environmentid,"Location") VALUES
	 (1,'Back porch'),
	 (2,'Backyard west north'),
	 (3,'Backyard east north'),
	 (4,'Front porch'),
	 (5,'Back porch'),
	 (6,'Backyard west middle'),
	 (7,'Backyard east middle'),
	 (8,'Front porch'),
	 (9,'Back porch'),
	 (10,'Backyard west south');
INSERT INTO "GardenManager".environment (environmentid,"Location") VALUES
	 (11,'East side of house'),
	 (12,'Front porch');

-- Pot
INSERT INTO "GardenManager".pot (environmentid,colour,"Radius","Height") VALUES
	 (1,'Terracotta',30.0,10.5),
	 (4,'Red',20.0,20.0),
	 (5,'Blue',11.0,17.0),
	 (8,'Purple',37.0,21.0),
	 (9,'Red',42.0,22.0),
	 (12,'Blue',41.0,31.0);

-- Bed
INSERT INTO "GardenManager".bed (environmentid,surfacearea) VALUES
	 (2,9.5),
	 (3,9.0),
	 (6,9.75),
	 (7,9.1),
	 (10,9.0),
	 (11,4.0);

-- Pest 
INSERT INTO "GardenManager".pest (pestname,"Type",description,"control") VALUES
	 ('Aphids','Insect','Very small insects ranging in colour from green, pinkish to black. Young aphids are wingless; adults can be winged or wingless. Aphids cluster on stems and/or undersides of leaves.','Biological controls like lacewing, ladybird beetles and ants are effective. Sticky traps are useful to catch winged aphids, as is insecticidal soap.'),
	 ('Cabbage aphid','Insect','Very small insects ranging in colour from green, pinkish to black. Young aphids are wingless; adults can be winged or wingless. Aphids cluster on stems and/or undersides of leaves.','Biological controls like lacewing, ladybird beetles and ants are effective. Sticky traps are useful to catch winged aphids, as is insecticidal soap.'),
	 ('Cabbage moth','Insect','Larvae are light green, 1 cm long, with white stripe along each side of the body. They often feed at the base of developing cabbage heads inside the leaves.','Pheromone traps are effective, as are biological methods like flies and wasps.'),
	 ('Fusarium wilt','Fungus','Fungus that affects both seedlings and mature plants. It causes the top growth to wilt, yellow and die. Lesions form at plant base or slightly below the soil line.','Remove and destroy infected plants; grow resistant varieties; raise the pH to 6.5-7 if soil is acidic. Microbial seed treatments are available and effective.'),
	 ('Leafminer','Insect','Larvae burrow underneath leaf surfaces leaving a visible trail as they eat their way through the leaf. Leafminers can be flies, wasps, moths, or sawflies.','Biological controls like parasitic wasps are effective; neem oil is effective if applied early.'),
	 ('Mosaic virus','Virus','Causes characteristic "mosaic" colouring in affected plants. Leaves are mottled with yellow, white, and light or dark green spots and streaks; plants are often stunted. Affects a wide variety of plants.','There is no cure, although virus-resistant varieties of many species exist. Remove all affected plants and destroy them -- virus persists in infected plant matter.'),
	 ('Rust','Fungus','Early symptoms are white, slightly raised spots on the underside of leaves that progress into larger reddish-brown spots.','Remove infected leaves and surrounding debris; fungicide is effective.'),
	 ('Scab','Fungus','Appears as a corky or crustaceous lesion on the surface of fruits, tubers, leaves or stems, and may be mistaken for insect damage.','Fungicide application is effective.'),
	 ('Slug','Animal','Slug feed on many types of plants, but prefer tender young seedlings. Slug damage can look like round holes in soft fruits like strawberries and tomatoes, or like irregularily shaped holes in leaves.','Can be removed by hand (best done at night since they are nocturnal feeders).'),
	 ('Smut','Fungus','Causes swelling in aboveground plant tissues. Plant cells become spongy-gray, then black as the spores mature.','There is no control; remove and destroy all infected plants.');
INSERT INTO "GardenManager".pest (pestname,"Type",description,"control") VALUES
	 ('Powdery mildew','Fungus','Plants infected with powdery mildew look as if they have been dusted with white powder, especially on the upper sides of leaves. Leaves may turn yellow and die.','Fungicides are effective for mild to moderate infection, but for severe cases the best method of control is to remove and destroy infected plants.');

-- IsSusceptible 
INSERT INTO "GardenManager".issusceptibleto (variety,genus,species,pestname) VALUES
	 ('Prizehead','Lactuca','sativa','Leafminer'),
	 ('Scarlet nantes','Daucus','carota','Leafminer'),
	 ('Detroit dark red','Beta','vulgaris','Scab'),
	 ('Detroit dark red','Beta','vulgaris','Leafminer'),
	 ('Kale green curled','Brassica','oleracea','Leafminer'),
	 ('Cabbage red express','Brassica','oleracea','Leafminer'),
	 ('Broccoli','Brassica','oleracea','Leafminer'),
	 ('Brussels sprouts','Brassica','oleracea','Cabbage aphid'),
	 ('Kale lacinato','Brassica','oleracea','Leafminer'),
	 ('Canadian early supersweet hybrid corn','Zea','mays','Rust');
INSERT INTO "GardenManager".issusceptibleto (variety,genus,species,pestname) VALUES
	 ('Canadian early supersweet hybrid corn','Zea','mays','Smut'),
	 ('Glaskin''s Perpetual Rhubarb','Rheum','rhabarbarum','Slug'),
	 ('Fresca strawberries','Fragaria','vesca','Slug'),
	 ('Prizehead','Lactuca','sativa','Slug'),
	 ('Scarlet nantes','Daucus','carota','Slug'),
	 ('Kale lacinato','Brassica','oleracea','Powdery mildew'),
	 ('Broccoli','Brassica','oleracea','Mosaic virus');

-- Activity 
INSERT INTO "GardenManager".activity (activityid,activitytype,"date") VALUES
	 (1,'Water','2020-07-01'),
	 (2,'Fertilize','2020-07-02'),
	 (3,'Fertilize','2020-07-03'),
	 (4,'Amend soil','2020-07-04'),
	 (5,'Water','2020-07-05'),
	 (6,'Amend soil','2020-07-06'),
	 (7,'Water','2020-07-07'),
	 (8,'Water','2020-07-08'),
	 (9,'Water','2020-07-09'),
	 (10,'Fertilize','2020-07-10');

-- Maintains 
INSERT INTO "GardenManager".maintains (activityid,environmentid) VALUES
	 (1,1),
	 (1,2),
	 (1,3),
	 (1,4),
	 (1,5),
	 (1,6),
	 (1,7),
	 (1,8),
	 (1,9),
	 (1,10);
INSERT INTO "GardenManager".maintains (activityid,environmentid) VALUES
	 (1,11),
	 (1,12),
	 (2,4),
	 (2,9),
	 (3,5),
	 (3,6),
	 (4,7),
	 (5,3),
	 (5,4),
	 (5,11);
INSERT INTO "GardenManager".maintains (activityid,environmentid) VALUES
	 (6,1),
	 (7,2),
	 (7,4),
	 (7,8),
	 (8,8),
	 (9,9),
	 (10,10);

-- Plants
INSERT INTO "GardenManager".plant (plantid,variety,genus,species,colour,healthstatus,environmentid) VALUES
	 (1,'Prizehead','Lactuca','sativa','','',1),
	 (2,'Scarlet nantes','Daucus','carota','','',2),
	 (3,'Detroit dark red','Beta','vulgaris','','',3),
	 (4,'Kale green curled','Brassica','oleracea','','',4),
	 (5,'Cabbage red express','Brassica','oleracea','','',5),
	 (6,'Broccoli','Brassica','oleracea','','',6),
	 (7,'Brussels sprouts','Brassica','oleracea','','',7),
	 (8,'Kale lacinato','Brassica','oleracea','','',9),
	 (9,'Canadian early supersweet hybrid corn','Zea','mays','','',10),
	 (10,'Glaskin''s Perpetual Rhubarb','Rheum','rhabarbarum','','',11);
INSERT INTO "GardenManager".plant (plantid,variety,genus,species,colour,healthstatus,environmentid) VALUES
	 (11,'Fresca strawberries','Fragaria','vesca','','',12),
	 (12,'Spearmint','Mentha','spicata','','',8),
	 (13,'Peppermint','Metha','x piperata','','',8);

-- PestSighting 
INSERT INTO "GardenManager".pestsighting (sightingid,pestname,severity,"Date") VALUES
	 (1,'Cabbage aphid','Mild','2020-07-15'),
	 (2,'Cabbage moth','Mild','2020-07-16'),
	 (3,'Leafminer','Moderate','2020-07-17'),
	 (4,'Mosaic virus','Severe','2020-07-18'),
	 (5,'Rust','Moderate','2020-07-19'),
	 (6,'Slug','Severe','2020-07-20');

-- Environment_Target 
INSERT INTO "GardenManager".environment_target (environmentid,sunlight,nutrients,soiltype,hydration) VALUES
	 (1,'Dappled sun','Fertilized','Sandy','Dry'),
	 (2,'Full shade','Depleted','Clay','Moist'),
	 (3,'Full sun','Fertilized','Silt','Wet'),
	 (4,'Partial shade','Depleted','Loam','Moist'),
	 (5,'Partial sun','Fertilized','Peat','Wet'),
	 (6,'Dappled sun','Depleted','Chalky','Wet'),
	 (7,'Full shade','Fertilized','Sandy','Dry'),
	 (8,'Full sun','Depleted','Clay','Wet'),
	 (9,'Partial shade','Fertilized','Silt','Moist'),
	 (10,'Partial sun','Depleted','Loam','Moist');
INSERT INTO "GardenManager".environment_target (environmentid,sunlight,nutrients,soiltype,hydration) VALUES
	 (11,'Full shade','Fertilized','Peat','Wet'),
	 (12,'Partial sun','Depleted','Chalky','Dry');

-- Environment_CurrentlyHas
INSERT INTO "GardenManager".environment_currentlyhas (environmentid,sunlight,nutrients,soiltype,hydration) VALUES
	 (2,'Full shade','Fertilized','Clay','Dry'),
	 (1,'Dappled sun','Fertilized','Sandy','Dry'),
	 (3,'Full sun','Fertilized','Silt','Wet'),
	 (4,'Partial shade','Depleted','Loam','Moist'),
	 (5,'Partial sun','Fertilized','Peat','Wet'),
	 (6,'Dappled sun','Depleted','Chalky','Wet'),
	 (7,'Full shade','Fertilized','Sandy','Dry'),
	 (8,'Full sun','Depleted','Clay','Wet'),
	 (9,'Partial shade','Fertilized','Silt','Moist'),
	 (10,'Partial sun','Depleted','Loam','Moist');
INSERT INTO "GardenManager".environment_currentlyhas (environmentid,sunlight,nutrients,soiltype,hydration) VALUES
	 (11,'Full shade','Fertilized','Peat','Wet'),
	 (12,'Partial sun','Depleted','Chalky','Dry');

-- Affects 
INSERT INTO "GardenManager".affects (plantid,activityid) VALUES
	 (1,1),
	 (2,1),
	 (3,1),
	 (4,1),
	 (5,1),
	 (6,1),
	 (7,1),
	 (12,1),
	 (8,1),
	 (9,1);
INSERT INTO "GardenManager".affects (plantid,activityid) VALUES
	 (10,1),
	 (11,1),
	 (4,2),
	 (8,2),
	 (5,3),
	 (6,3),
	 (7,4),
	 (3,5),
	 (4,5),
	 (10,5);
INSERT INTO "GardenManager".affects (plantid,activityid) VALUES
	 (1,6),
	 (2,7),
	 (4,7),
	 (12,7),
	 (13,8),
	 (8,9),
	 (9,10);

-- ThrivesIn
INSERT INTO "GardenManager".thrivesin (variety,genus,species,sunlight,nutrients,soiltype,hydration) VALUES
	 ('Prizehead','Lactuca','sativa','Partial sun','Fertilized','Loam','Moist'),
	 ('Scarlet nantes','Daucus','carota','Full sun','Fertilized','Loam','Moist'),
	 ('Scarlet nantes','Daucus','carota','Full sun','Fertilized','Silt','Moist'),
	 ('Detroit dark red','Beta','vulgaris','Full sun','Fertilized','Loam','Moist'),
	 ('Kale green curled','Brassica','oleracea','Partial sun','Fertilized','Loam','Moist'),
	 ('Cabbage red express','Brassica','oleracea','Partial sun','Fertilized','Loam','Moist'),
	 ('Broccoli','Brassica','oleracea','Partial sun','Fertilized','Loam','Moist'),
	 ('Brussels sprouts','Brassica','oleracea','Full sun','Fertilized','Loam','Moist'),
	 ('Kale lacinato','Brassica','oleracea','Partial sun','Fertilized','Loam','Moist'),
	 ('Canadian early supersweet hybrid corn','Zea','mays','Full sun','Fertilized','Loam','Moist');
INSERT INTO "GardenManager".thrivesin (variety,genus,species,sunlight,nutrients,soiltype,hydration) VALUES
	 ('Canadian early supersweet hybrid corn','Zea','mays','Full sun','Fertilized','Loam','Dry'),
	 ('Glaskin''s Perpetual Rhubarb','Rheum','rhabarbarum','Partial shade','Fertilized','Loam','Moist'),
	 ('Glaskin''s Perpetual Rhubarb','Rheum','rhabarbarum','Partial sun','Fertilized','Clay','Moist'),
	 ('Fresca strawberries','Fragaria','vesca','Partial sun','Fertilized','Sandy','Moist'),
	 ('Spearmint','Mentha','spicata','Full sun','Fertilized','Loam','Moist'),
	 ('Peppermint','Metha','x piperata','Full sun','Fertilized','Loam','Moist'),
	 ('Spearmint','Mentha','spicata','Partial sun','Fertilized','Loam','Moist'),
	 ('Peppermint','Metha','x piperata','Partial sun','Fertilized','Loam','Moist'),
	 ('Spearmint','Mentha','spicata','Full sun','Depleted','Loam','Moist'),
	 ('Peppermint','Metha','x piperata','Full sun','Depleted','Loam','Moist');
INSERT INTO "GardenManager".thrivesin (variety,genus,species,sunlight,nutrients,soiltype,hydration) VALUES
	 ('Spearmint','Mentha','spicata','Partial sun','Depleted','Loam','Moist'),
	 ('Peppermint','Metha','x piperata','Partial sun','Depleted','Loam','Moist'),
	 ('Spearmint','Mentha','spicata','Full sun','Fertilized','Loam','Dry'),
	 ('Peppermint','Metha','x piperata','Full sun','Fertilized','Loam','Dry'),
	 ('Spearmint','Mentha','spicata','Partial sun','Fertilized','Loam','Dry'),
	 ('Peppermint','Metha','x piperata','Partial sun','Fertilized','Loam','Dry'),
	 ('Spearmint','Mentha','spicata','Full sun','Depleted','Loam','Dry'),
	 ('Peppermint','Metha','x piperata','Full sun','Depleted','Loam','Dry'),
	 ('Spearmint','Mentha','spicata','Partial sun','Depleted','Loam','Dry'),
	 ('Peppermint','Metha','x piperata','Partial sun','Depleted','Loam','Dry');

-- Has
INSERT INTO "GardenManager".has (plantid,sightingid) VALUES
	 (5,1),
	 (4,2),
	 (7,3),
	 (1,4),
	 (2,5),
	 (11,6),
	 (3,1),
	 (8,1);