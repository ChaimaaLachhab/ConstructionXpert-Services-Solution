-- Create the database
CREATE DATABASE project_management_db;

-- Use the database
USE project_management_db;

-- Create the projects table
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    project_img VARCHAR(255),
    description TEXT,
    start_date DATE,
    end_date DATE,
    budget DOUBLE,
	type_project ENUM('COMMERCIAL', 'EDUCATION', 'GOVERNMENT', 'INFRASTRUCTURE', 'RESIDENTIAL', 'HEALTHCARE') NOT NULL
);

INSERT INTO projects (project_name, project_img, description, start_date, end_date, budget, type_project) 
VALUES 
('Centre Commercial Springfield', 'https://c8.alamy.com/compfr/mpk253/site-de-construction-la-thailande-thai-site-de-construction-centre-commercial-terminal-21-pattaya-le-developpement-de-l-asie-du-sud-est-mpk253.jpg', 'Construction d\'un nouveau centre commercial comprenant des magasins, des restaurants et un cinéma.', '2024-03-15', '2025-06-30', 5000000.00, 'COMMERCIAL'),
('Extension de l\'École Primaire Maple', 'https://www.metrogram.archi/public/img/big/20190904173300jpg_5ecfebbe3b787.jpg', 'Extension de l\'école primaire Maple pour accueillir plus d\'étudiants.', '2024-02-01', '2024-12-31', 750000.00, 'EDUCATION'),
('Réhabilitation des Routes Urbaines', 'https://img.freepik.com/photos-premium/grand-chantier-construction-route-restauration-dans-pont-renovation-echangeur-routier-moderne_73110-10382.jpg', 'Réhabilitation des routes urbaines principales pour améliorer la circulation et la sécurité routière.', '2024-04-10', '2025-04-10', 2000000.00, 'INFRASTRUCTURE'),
('Construction de l\'Hôpital Régional', 'https://img.batiweb.com/repo-images/article/44387/Hopital-Rabat.webp', 'Construction d\'un nouvel hôpital régional avec des services de soins complets.', '2024-01-20', '2025-03-30', 8000000.00, 'HEALTHCARE');

-- Create the tasks table
CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    task_name VARCHAR(255) NOT NULL,
    task_img VARCHAR(255),
    description TEXT,
    start_date DATE,
    end_date DATE,
    status ENUM('NOT_STARTED', 'IN_PROGRESS', 'COMPLETED'),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);

-- Insérer des tâches dans la table tasks
INSERT INTO tasks (project_id, task_name, task_img, description, start_date, end_date, status) 
VALUES 
(1, 'Préparation du site', 'https://images.squarespace-cdn.com/content/v1/6075f306c72ef7442cb1f86d/6b9ffdfa-d608-436c-b8b0-28728c8e2622/DJI_0401.JPG', 'Nettoyage et préparation du site pour la construction.', '2024-03-15', '2024-04-15', 'IN_PROGRESS'),
(1, 'Construction des fondations', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Under_construction_icon-yellow.svg/1242px-Under_construction_icon-yellow.svg.png', 'Pose des fondations pour le centre commercial.', '2024-04-16', '2024-06-30', 'NOT_STARTED'),
(2, 'Extension des bâtiments', 'https://example.com/task_img3.jpg', 'Extension des bâtiments existants pour ajouter de nouvelles classes.', '2024-02-01', '2024-07-31', 'IN_PROGRESS'),
(2, 'Installation des équipements', 'https://example.com/task_img4.jpg', 'Installation des équipements dans les nouvelles classes.', '2024-08-01', '2024-12-31', 'NOT_STARTED'),
(3, 'Réparation des routes', 'https://example.com/task_img5.jpg', 'Réparation des principales routes urbaines.', '2024-04-10', '2024-12-31', 'NOT_STARTED'),
(4, 'Construction du bâtiment principal', 'https://example.com/task_img6.jpg', 'Construction du bâtiment principal de l\'hôpital.', '2024-01-20', '2024-12-31', 'IN_PROGRESS'),
(4, 'Installation des systèmes médicaux', 'https://example.com/task_img7.jpg', 'Installation des équipements médicaux.', '2025-01-01', '2025-03-30', 'NOT_STARTED');


-- Create the resources table
CREATE TABLE IF NOT EXISTS resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    task_id INT,
    resource_name VARCHAR(255) NOT NULL,
    resource_img VARCHAR(255),
    type ENUM('EQUIPMENT', 'PERSONNEL', 'MATERIALS', 'SOFTWARE'),
    quantity INT,
    supplier_information TEXT,
    FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE
);

INSERT INTO resources (resource_name, resource_img, type, quantity, supplier_information)
VALUES
('Excavator', 'https://maydayrental.com.au/wp-content/uploads/2022/09/excavator-komatsu-pc300-2.png', 'EQUIPMENT', 2, 'Supplier: ABC Machinery Co.'),
('Bulldozer', 'https://medias.kiloutou.fr/v2/content/media-library/kgab15_bulls_bulldozer_chenilles_01_20221115_e9712f9ec5.png', 'EQUIPMENT', 1, 'Supplier: HeavyMachinery Co.'),
('Concrete Mixer', 'https://euromix.de/wp-content/uploads/2022/08/sl2.png', 'EQUIPMENT', 1, 'Supplier: XYZ Construction Supplies'),
('Scaffolding', 'https://northscaffold.com/content/files/item%20system%20pages/ring%20assembly%206.webp', 'EQUIPMENT', 10, 'Supplier: BuildSafe Equipments'),

('Steel Beams', 'https://www.walltheory.ca/cdn/shop/products/IMG_4528_1200x1200.heic?v=1682695358', 'MATERIALS', 50, 'Supplier: SteelWorks Ltd.'),
('Cement', 'https://static.vecteezy.com/system/resources/previews/036/353/893/original/ai-generated-a-bag-of-cement-in-a-pile-of-cement-file-of-isolated-cutout-object-on-transparent-background-png.png', 'MATERIALS', 100, 'Supplier: Cement Corp.'),
('Bricks', 'https://diyfs.co.za/wp-content/uploads/2022/04/DIY-Superstore-Bricks-Bloemfontein-03.webp', 'MATERIALS', 2000, 'Supplier: Brickworks Inc.'),
('Wood Planks', 'https://static.vecteezy.com/system/resources/previews/036/333/907/original/ai-generated-textured-rough-wood-planks-pile-png.png', 'MATERIALS', 500, 'Supplier: TimberSupply Ltd.'),

('John Doe', NULL, 'PERSONNEL', 1, 'Role: Project Manager, Contact: johndoe@example.com'),
('Jane Smith', NULL, 'PERSONNEL', 1, 'Role: Civil Engineer, Contact: janesmith@example.com'),
('Construction Workers', NULL, 'PERSONNEL', 20, 'Role: General Labor, Contact: laborers@example.com'),
('Electricians', NULL, 'PERSONNEL', 5, 'Role: Electrical Work, Contact: electricians@example.com'),

('AutoCAD', 'https://i0.wp.com/atlancad.fr/wp-content/uploads/2022/03/autodesk-autocad-small_social-400.png?fit=400%2C400&ssl=1', 'SOFTWARE', 5, 'Supplier: Autodesk Inc.'),
('Revit', 'https://www.altam.fr/wp-content/uploads/2024/01/autodesk-revit-small-social-400.png', 'SOFTWARE', 3, 'Supplier: Autodesk Inc.'),
('Microsoft Project', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Microsoft_Project_%282019%E2%80%93present%29.svg/1200px-Microsoft_Project_%282019%E2%80%93present%29.svg.png', 'SOFTWARE', 4, 'Supplier: Microsoft Corporation');

-- Liage des ressources aux tâches

-- Ressources pour la tâche 'Préparation du site' (task_id = 1)
UPDATE resources SET task_id = 1 WHERE resource_id = 1; -- Excavator
UPDATE resources SET task_id = 1 WHERE resource_id = 3; -- Concrete Mixer

-- Ressources pour la tâche 'Construction des fondations' (task_id = 2)
UPDATE resources SET task_id = 2 WHERE resource_id = 2; -- Bulldozer
UPDATE resources SET task_id = 2 WHERE resource_id = 5; -- Steel Beams
UPDATE resources SET task_id = 2 WHERE resource_id = 6; -- Cement
UPDATE resources SET task_id = 2 WHERE resource_id = 7; -- Bricks

-- Ressources pour la tâche 'Extension des bâtiments' (task_id = 3)
UPDATE resources SET task_id = 3 WHERE resource_id = 8; -- Wood Planks
UPDATE resources SET task_id = 3 WHERE resource_id = 10; -- Jane Smith (Civil Engineer)

-- Ressources pour la tâche 'Installation des équipements' (task_id = 4)
UPDATE resources SET task_id = 4 WHERE resource_id = 11; -- Construction Workers
UPDATE resources SET task_id = 4 WHERE resource_id = 12; -- Electricians

-- Ressources pour la tâche 'Réparation des routes' (task_id = 5)
UPDATE resources SET task_id = 5 WHERE resource_id = 4; -- Scaffolding
UPDATE resources SET task_id = 5 WHERE resource_id = 13; -- John Doe (Project Manager)

-- Ressources pour la tâche 'Construction du bâtiment principal' (task_id = 6)
UPDATE resources SET task_id = 6 WHERE resource_id = 6; -- Cement
UPDATE resources SET task_id = 6 WHERE resource_id = 8; -- Wood Planks
UPDATE resources SET task_id = 6 WHERE resource_id = 11; -- Construction Workers

-- Ressources pour la tâche 'Installation des systèmes médicaux' (task_id = 7)
UPDATE resources SET task_id = 7 WHERE resource_id = 14; -- AutoCAD
UPDATE resources SET task_id = 7 WHERE resource_id = 15; -- Revit
UPDATE resources SET task_id = 7 WHERE resource_id = 16; -- Microsoft Project
