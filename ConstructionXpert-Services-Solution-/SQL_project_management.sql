CREATE DATABASE project_management_db;

USE project_management_db;

CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    budget DOUBLE
);

CREATE TABLE tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    task_name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    status ENUM('NOT_STARTED', 'IN_PROGRESS', 'COMPLETED'),
    FOREIGN KEY (project_id) REFERENCES projects(project_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,
    task_id INT,
    resource_name VARCHAR(255) NOT NULL,
    type ENUM('EQUIPMENT', 'PERSONNEL', 'MATERIALS', 'SOFTWARE'),
    quantity INT,
    supplier_information TEXT,
    FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE
);
