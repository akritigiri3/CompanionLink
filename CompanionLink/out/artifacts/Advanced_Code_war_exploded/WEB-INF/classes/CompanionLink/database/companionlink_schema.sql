DROP DATABASE IF EXISTS companion_link;
CREATE DATABASE companion_link CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE companion_link;

CREATE TABLE roles (
    role_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE account_statuses (
    status_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE request_statuses (
    request_status_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE visit_statuses (
    visit_status_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE report_statuses (
    report_status_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE enquiry_statuses (
    enquiry_status_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    role_id TINYINT UNSIGNED NOT NULL,
    status_id TINYINT UNSIGNED NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    phone VARCHAR(25) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    password_hash CHAR(64) NOT NULL,
    address VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES roles(role_id),
    CONSTRAINT fk_users_status FOREIGN KEY (status_id) REFERENCES account_statuses(status_id)
);

CREATE TABLE senior_profiles (
    senior_id INT PRIMARY KEY,
    health_notes TEXT,
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(25),
    emergency_contact_relation VARCHAR(50),
    CONSTRAINT fk_senior_profiles_user FOREIGN KEY (senior_id) REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE volunteer_profiles (
    volunteer_id INT PRIMARY KEY,
    bio TEXT,
    availability VARCHAR(255),
    approved_by INT NULL,
    approved_at DATETIME NULL,
    rejection_reason VARCHAR(255),
    CONSTRAINT fk_volunteer_profiles_user FOREIGN KEY (volunteer_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_volunteer_approved_by FOREIGN KEY (approved_by) REFERENCES users(user_id) ON DELETE SET NULL
);

CREATE TABLE skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE volunteer_skills (
    volunteer_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (volunteer_id, skill_id),
    CONSTRAINT fk_volunteer_skills_volunteer FOREIGN KEY (volunteer_id) REFERENCES volunteer_profiles(volunteer_id) ON DELETE CASCADE,
    CONSTRAINT fk_volunteer_skills_skill FOREIGN KEY (skill_id) REFERENCES skills(skill_id) ON DELETE CASCADE
);

CREATE TABLE activity_types (
    activity_type_id INT PRIMARY KEY AUTO_INCREMENT,
    activity_name VARCHAR(80) NOT NULL UNIQUE,
    description VARCHAR(255),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE companion_requests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    senior_id INT NOT NULL,
    activity_type_id INT NOT NULL,
    request_status_id TINYINT UNSIGNED NOT NULL,
    preferred_datetime DATETIME NOT NULL,
    location_area VARCHAR(120) NOT NULL,
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_requests_senior FOREIGN KEY (senior_id) REFERENCES senior_profiles(senior_id) ON DELETE RESTRICT,
    CONSTRAINT fk_requests_activity FOREIGN KEY (activity_type_id) REFERENCES activity_types(activity_type_id) ON DELETE RESTRICT,
    CONSTRAINT fk_requests_status FOREIGN KEY (request_status_id) REFERENCES request_statuses(request_status_id) ON DELETE RESTRICT
);

CREATE TABLE visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    request_id INT NOT NULL UNIQUE,
    volunteer_id INT NOT NULL,
    visit_status_id TINYINT UNSIGNED NOT NULL,
    scheduled_at DATETIME NOT NULL,
    actual_duration_minutes INT NULL,
    volunteer_notes TEXT,
    completed_at DATETIME NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_visits_request FOREIGN KEY (request_id) REFERENCES companion_requests(request_id) ON DELETE RESTRICT,
    CONSTRAINT fk_visits_volunteer FOREIGN KEY (volunteer_id) REFERENCES volunteer_profiles(volunteer_id) ON DELETE RESTRICT,
    CONSTRAINT fk_visits_status FOREIGN KEY (visit_status_id) REFERENCES visit_statuses(visit_status_id) ON DELETE RESTRICT,
    CONSTRAINT chk_visit_duration CHECK (actual_duration_minutes IS NULL OR actual_duration_minutes > 0)
);

CREATE TABLE ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_id INT NOT NULL UNIQUE,
    stars INT NOT NULL,
    comment TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_ratings_visit FOREIGN KEY (visit_id) REFERENCES visits(visit_id) ON DELETE CASCADE,
    CONSTRAINT chk_rating_stars CHECK (stars BETWEEN 1 AND 5)
);

CREATE TABLE safety_reports (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    senior_id INT NOT NULL,
    volunteer_id INT NULL,
    visit_id INT NULL,
    report_status_id TINYINT UNSIGNED NOT NULL,
    description TEXT NOT NULL,
    admin_notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    resolved_at DATETIME NULL,
    CONSTRAINT fk_reports_senior FOREIGN KEY (senior_id) REFERENCES senior_profiles(senior_id) ON DELETE RESTRICT,
    CONSTRAINT fk_reports_volunteer FOREIGN KEY (volunteer_id) REFERENCES volunteer_profiles(volunteer_id) ON DELETE SET NULL,
    CONSTRAINT fk_reports_visit FOREIGN KEY (visit_id) REFERENCES visits(visit_id) ON DELETE SET NULL,
    CONSTRAINT fk_reports_status FOREIGN KEY (report_status_id) REFERENCES report_statuses(report_status_id) ON DELETE RESTRICT
);

CREATE TABLE contact_enquiries (
    enquiry_id INT PRIMARY KEY AUTO_INCREMENT,
    enquiry_status_id TINYINT UNSIGNED NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_enquiries_status FOREIGN KEY (enquiry_status_id) REFERENCES enquiry_statuses(enquiry_status_id) ON DELETE RESTRICT
);

CREATE INDEX idx_users_role_status ON users(role_id, status_id);
CREATE INDEX idx_requests_status ON companion_requests(request_status_id);
CREATE INDEX idx_requests_senior ON companion_requests(senior_id);
CREATE INDEX idx_visits_volunteer ON visits(volunteer_id);
CREATE INDEX idx_reports_status ON safety_reports(report_status_id);

INSERT INTO roles(role_id, role_name) VALUES (1,'ADMIN'),(2,'SENIOR'),(3,'VOLUNTEER');
INSERT INTO account_statuses(status_id, status_name) VALUES (1,'PENDING'),(2,'ACTIVE'),(3,'INACTIVE'),(4,'REJECTED');
INSERT INTO request_statuses(request_status_id, status_name) VALUES (1,'OPEN'),(2,'ACCEPTED'),(3,'COMPLETED'),(4,'CANCELLED');
INSERT INTO visit_statuses(visit_status_id, status_name) VALUES (1,'ACCEPTED'),(2,'COMPLETED'),(3,'CANCELLED');
INSERT INTO report_statuses(report_status_id, status_name) VALUES (1,'PENDING'),(2,'REVIEWING'),(3,'CLOSED');
INSERT INTO enquiry_statuses(enquiry_status_id, status_name) VALUES (1,'NEW'),(2,'READ'),(3,'CLOSED');

INSERT INTO users(user_id, role_id, status_id, full_name, email, phone, date_of_birth, password_hash, address) VALUES
(1,1,2,'System Admin','admin@companionlink.local','9800000000','1990-01-01',SHA2('Admin123',256),'Itahari'),
(2,2,2,'Maya Gurung','senior@companionlink.local','9800000001','1955-04-10',SHA2('Senior123',256),'Itahari-6'),
(3,3,2,'Anish Rai','volunteer@companionlink.local','9800000002','2001-07-21',SHA2('Volunteer123',256),'Itahari'),
(4,3,1,'Pending Volunteer','pending@companionlink.local','9800000003','2002-02-15',SHA2('Pending123',256),'Itahari');

INSERT INTO senior_profiles(senior_id, health_notes, emergency_contact_name, emergency_contact_phone, emergency_contact_relation) VALUES
(2,'Diabetic, prefers morning walks.','Sita Gurung','9811111111','Daughter');

INSERT INTO volunteer_profiles(volunteer_id, bio, availability, approved_by, approved_at) VALUES
(3,'Friendly community volunteer interested in helping seniors.','Weekends and evenings',1,NOW()),
(4,'Waiting for admin approval.','Weekdays',NULL,NULL);

INSERT INTO skills(skill_id, skill_name) VALUES
(1,'Walking'),(2,'Smartphone Help'),(3,'Reading'),(4,'Tea Conversation'),(5,'Shopping Support');

INSERT INTO volunteer_skills(volunteer_id, skill_id) VALUES
(3,1),(3,2),(3,3),(4,4),(4,5);

INSERT INTO activity_types(activity_type_id, activity_name, description, is_active) VALUES
(1,'Morning Walk','Short friendly walks in nearby safe areas.',TRUE),
(2,'Tea and Conversation','Friendly conversation and companionship.',TRUE),
(3,'Smartphone Help','Help with basic smartphone or internet tasks.',TRUE),
(4,'Reading Together','Reading books, newspapers, or letters together.',TRUE),
(5,'Grocery Support','Companionship and basic help during grocery shopping.',TRUE);

INSERT INTO companion_requests(request_id, senior_id, activity_type_id, request_status_id, preferred_datetime, location_area, notes) VALUES
(1,2,1,1,DATE_ADD(NOW(), INTERVAL 2 DAY),'Itahari-6','I would like a short morning walk near my home area.'),
(2,2,3,1,DATE_ADD(NOW(), INTERVAL 4 DAY),'Itahari Chowk','Need help setting up video call on phone.');

INSERT INTO contact_enquiries(enquiry_status_id, name, email, message) VALUES
(1,'Example Visitor','visitor@example.com','Can my family help my grandmother register?');

CREATE VIEW v_volunteer_average_ratings AS
SELECT vp.volunteer_id, u.full_name AS volunteer_name,
       COALESCE(ROUND(AVG(r.stars), 2), 0.00) AS average_rating,
       COUNT(r.rating_id) AS total_ratings
FROM volunteer_profiles vp
JOIN users u ON vp.volunteer_id = u.user_id
LEFT JOIN visits v ON vp.volunteer_id = v.volunteer_id
LEFT JOIN ratings r ON v.visit_id = r.visit_id
GROUP BY vp.volunteer_id, u.full_name;

CREATE VIEW v_volunteer_skill_list AS
SELECT vp.volunteer_id, u.full_name AS volunteer_name,
       GROUP_CONCAT(s.skill_name ORDER BY s.skill_name SEPARATOR ', ') AS skills
FROM volunteer_profiles vp
JOIN users u ON vp.volunteer_id = u.user_id
LEFT JOIN volunteer_skills vs ON vp.volunteer_id = vs.volunteer_id
LEFT JOIN skills s ON vs.skill_id = s.skill_id
GROUP BY vp.volunteer_id, u.full_name;

CREATE VIEW v_user_details AS
SELECT u.user_id AS id, u.full_name, u.email, u.phone, u.date_of_birth, u.password_hash,
       r.role_name AS role, ast.status_name AS status, u.address, u.created_at,
       sp.health_notes,
       CONCAT_WS(' - ', sp.emergency_contact_name, sp.emergency_contact_phone, sp.emergency_contact_relation) AS emergency_contact,
       vp.bio, vp.availability,
       COALESCE(vsl.skills, '') AS skills,
       COALESCE(var.average_rating, 0.00) AS average_rating
FROM users u
JOIN roles r ON u.role_id = r.role_id
JOIN account_statuses ast ON u.status_id = ast.status_id
LEFT JOIN senior_profiles sp ON u.user_id = sp.senior_id
LEFT JOIN volunteer_profiles vp ON u.user_id = vp.volunteer_id
LEFT JOIN v_volunteer_skill_list vsl ON u.user_id = vsl.volunteer_id
LEFT JOIN v_volunteer_average_ratings var ON u.user_id = var.volunteer_id;

SHOW TABLES;
