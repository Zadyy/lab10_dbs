create database lab10_dbs;
use lab10_dbs;

DROP TABLE IF EXISTS list_of_devs;
DROP TABLE IF EXISTS user_log;
DROP TABLE IF EXISTS salary_log;
DROP TABLE IF EXISTS user_support;
DROP TABLE IF EXISTS user_payment_log;
DROP TABLE IF EXISTS software_product;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS workers;


CREATE TABLE workers(
    worker_id CHAR(5),
    worker_first_name VARCHAR(50) NOT null,
    worker_last_name VARCHAR(50) NOT null,
    POSITION VARCHAR(30) DEFAULT "Not Set" CHECK (position IN ("CEO","CIO","Developer","Manager","Human resource","Engineer","Plumber","Receptionist","User Support","Accountant","Lawyer","Not Set","System admin")),
    phone_no CHAR(8) UNIQUE,
    salary real DEFAULT 0,
    STATUS BOOLEAN DEFAULT True,
    gender varchar(2) DEFAULT "NA" CHECK (gender IN ("M","F")),
    mail varchar(50) CHECK (mail like "%@%.%"),
    address varchar(200),
    PRIMARY KEY (worker_id)   
);

CREATE TABLE users(
    user_id CHAR(5),
    user_name VARCHAR(100) UNIQUE NOT null,
    user_type VARCHAR(8) DEFAULT "Not Set" CHECK (user_type IN ("Personal","Company")),
    registry_date DATE DEFAULT CURRENT_TIMESTAMP,
    phone_no CHAR(8) UNIQUE,
    mail varchar(50) CHECK (mail like "%@%.%"),
    PRIMARY KEY (user_id)
); 

CREATE TABLE software_product(
    software_id CHAR(4),
    software_name VARCHAR(50) UNIQUE NOT null,
    no_of_active_devs INT DEFAULT 0,
    begin_date DATE DEFAULT CURRENT_TIMESTAMP,
    software_type VARCHAR(20) DEFAULT "Not Set",
	PRIMARY KEY (software_id)
); 

CREATE TABLE salary_log(
    worker_id CHAR(5),
    salary_amount REAL NOT null,
    bank_account INT NOT null,
    bank_type VARCHAR(50) DEFAULT "Not Set" CHECK (bank_type IN ("Khan Bank", "Khaan bank", "Hudaldaa hugjliin bank", "TDB", "Golomt bank", "State bank", "Turiin bank", "Khas bank", "Capitron bank", "Teewer Hugjliin bank", "Arig bank", "Chingis khaan bank", "M Bank", "Hi pay", "Mobi finance")),
    account_name VARCHAR(100) DEFAULT "Not Set",
    transaction_date DATE DEFAULT CURRENT_TIMESTAMP,
    STATUS BOOLEAN DEFAULT True,
    FOREIGN KEY (worker_id) REFERENCES workers(worker_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE list_of_devs(
    software_id CHAR(4),
    worker_id CHAR(5),
    team_pos VARCHAR(50) DEFAULT "Developer" CHECK (team_pos IN ("Developer","Tester","Requirement analyst","Manager","CIO","Scrum master","System admin","Lawyer","Guest","User","Company","CEO","Project Sponsor","Steering committee")),
    FOREIGN KEY (software_id) REFERENCES software_product(software_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (worker_id) REFERENCES workers(worker_id) ON UPDATE CASCADE ON DELETE RESTRICT
); 

CREATE TABLE user_log(
    software_id CHAR(4),
    user_id CHAR(5),
    date_of_subs DATE DEFAULT CURRENT_TIMESTAMP,
    STATUS BOOLEAN DEFAULT True,
    FOREIGN KEY (software_id) REFERENCES software_product(software_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE user_payment_log(
    software_id CHAR(4),
    user_id CHAR(5),
    amount REAL NOT null,
    payment_date DATE DEFAULT CURRENT_TIMESTAMP,
    payment_id int UNIQUE AUTO_INCREMENT,
    FOREIGN KEY (software_id) REFERENCES software_product(software_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE user_support(
    worker_id CHAR(4),
    user_id CHAR(5),
    problem_detail VARCHAR(1000) NOT null DEFAULT "No Content",
    COMMENT VARCHAR(1000) NOT null DEFAULT "No Content",
    STATUS BOOLEAN DEFAULT False,
    FOREIGN KEY (worker_id) REFERENCES workers(worker_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

DELIMITER //
CREATE TRIGGER valid_phone_no_workers BEFORE INSERT ON workers
FOR EACH ROW BEGIN
	IF NOT (
        NEW.phone_no LIKE '85______' OR
        NEW.phone_no LIKE '94______' OR
        NEW.phone_no LIKE '95______' OR
        NEW.phone_no LIKE '99______' OR
        NEW.phone_no LIKE '90______' OR
        NEW.phone_no LIKE '91______' OR
        NEW.phone_no LIKE '96______' OR
        NEW.phone_no LIKE '80______' OR
        NEW.phone_no LIKE '86______' OR
        NEW.phone_no LIKE '88______' OR
        NEW.phone_no LIKE '89______' OR
        NEW.phone_no LIKE '830_____' OR
        NEW.phone_no LIKE '831_____' OR
        NEW.phone_no LIKE '930_____' OR
        NEW.phone_no LIKE '931_____' OR
        NEW.phone_no LIKE '932_____' OR
        NEW.phone_no LIKE '933_____' OR
        NEW.phone_no LIKE '934_____' OR
        NEW.phone_no LIKE '970_____' OR
        NEW.phone_no LIKE '971_____'
        ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Utasnii dugaaraa zuw oruulna uu?";
        END IF;
END//



DELIMITER //
CREATE TRIGGER valid_phone_no_users BEFORE INSERT ON users
FOR EACH ROW BEGIN
	IF NOT (
        NEW.phone_no LIKE '85______' OR
        NEW.phone_no LIKE '94______' OR
        NEW.phone_no LIKE '95______' OR
        NEW.phone_no LIKE '99______' OR
        NEW.phone_no LIKE '90______' OR
        NEW.phone_no LIKE '91______' OR
        NEW.phone_no LIKE '96______' OR
        NEW.phone_no LIKE '80______' OR
        NEW.phone_no LIKE '86______' OR
        NEW.phone_no LIKE '88______' OR
        NEW.phone_no LIKE '89______' OR
        NEW.phone_no LIKE '830_____' OR
        NEW.phone_no LIKE '831_____' OR
        NEW.phone_no LIKE '930_____' OR
        NEW.phone_no LIKE '931_____' OR
        NEW.phone_no LIKE '932_____' OR
        NEW.phone_no LIKE '933_____' OR
        NEW.phone_no LIKE '934_____' OR
        NEW.phone_no LIKE '970_____' OR
        NEW.phone_no LIKE '971_____' OR
        NEW.phone_no LIKE '700_____' OR
        NEW.phone_no LIKE '701_____' OR
        NEW.phone_no LIKE '702_____' OR
        NEW.phone_no LIKE '703_____' OR
        NEW.phone_no LIKE '704_____' OR
        NEW.phone_no LIKE '705_____' OR
        NEW.phone_no LIKE '7128____' OR
        NEW.phone_no LIKE '92______' OR
        NEW.phone_no LIKE '7500____' OR
        NEW.phone_no LIKE '7505____' OR
        NEW.phone_no LIKE '7507____' OR
        NEW.phone_no LIKE '7509____' OR
        NEW.phone_no LIKE '7510____' OR
        NEW.phone_no LIKE '7511____' OR
        NEW.phone_no LIKE '7515____' OR
        NEW.phone_no LIKE '7533____' OR
        NEW.phone_no LIKE '7535____' OR
        NEW.phone_no LIKE '7555____' OR
        NEW.phone_no LIKE '7557____' OR
        NEW.phone_no LIKE '7575____' OR
        NEW.phone_no LIKE '7577____' OR
        NEW.phone_no LIKE '7585____' OR
        NEW.phone_no LIKE '7595____' OR
        NEW.phone_no LIKE '77______' OR
        NEW.phone_no LIKE '760_____' OR
        NEW.phone_no LIKE '761_____' OR
        NEW.phone_no LIKE '766_____' OR
        NEW.phone_no LIKE '767_____' OR
        NEW.phone_no LIKE '780_____' OR
        NEW.phone_no LIKE '781_____' OR
        NEW.phone_no LIKE '7979____' OR
        NEW.phone_no LIKE '7996____' OR
        NEW.phone_no LIKE '7997____' OR
        NEW.phone_no LIKE '7998____' OR
        NEW.phone_no LIKE '7999____' OR
        NEW.phone_no LIKE '7210____' OR
        NEW.phone_no LIKE '7211____' OR
        NEW.phone_no LIKE '7270____' OR
        NEW.phone_no LIKE '7272____' OR
        NEW.phone_no LIKE '7217____'
        ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Utasnii dugaaraa zuw oruulna uu?";
        END IF;
END//

/* Data */


INSERT INTO workers (worker_id, worker_first_name, worker_last_name, phone_no, salary, gender, mail) VALUES
('W0001', 'Batbayar', 'Tserendorj', '88012345', 750000.00, 'M', 'batbayar.tserendorj@gmail.com'),
('W0002', 'Enkhjin', 'Erdenebayar', '88023456', 800000.00, 'F', 'enkhjin.erdenebayar@yahoo.com'),
('W0003', 'Ganbold', 'Purevdorj', '88034567', 600000.00, 'M', 'ganbold.purevdorj@gmail.com'),
('W0004', 'Dulmaa', 'Narangerel', '88045678', 1200000.00, 'F', 'dulmaa.narangerel@yahoo.com'),
('W0005', 'Tungalag', 'Dorj', '88056789', 900000.00, 'F', 'tungalag.dorj@gmail.com'),
('W0006', 'Altangerel', 'Ganbaatar', '88067890', 1500000.00, 'M','altangerel.ganbaatar@yahoo.com'),
('W0007', 'Battulga', 'Baasanjav', '88078901', 2000000.00, 'M','battulga.baasanjav@gmail.com'),
('W0008', 'Oyungerel', 'Jargalsaikhan', '88089012', 1000000.00, 'F', 'oyungerel.jargalsaikhan@yahoo.com'),
('W0009', 'Munkhbayar', 'Chuluunbat', '88090123', 800000.00, 'M', 'munkhbayar.chuluunbat@gmail.com'),
('W0010', 'Naranbaatar', 'Batzorig', '88001234', 1100000.00, 'M', 'naranbaatar.batzorig@yahoo.com');


INSERT INTO users (user_id, user_name, user_type, phone_no, mail) VALUES
('U0001', 'Batbayar', 'Personal', '95000111', 'batbayar@yahoo.com'),
('U0002', 'Enkhjin', 'Personal', '95000222', 'enkhjin@yahoo.com'),
('U0003', 'Ganbold', 'Personal', '95000333', 'ganbold@gmail.com'),
('U0004', 'Dulmaa', 'Personal', '95000444', 'dulmaa@yahoo.com'),
('U0005', 'Tungalag', 'Personal', '95000555', 'tungalag@yahoo.com'),
('U0006', 'Altangerel', 'Personal', '95000666', 'altangerel@yahoo.com'),
('U0007', 'Battulga', 'Personal', '95000777', 'battulga@yahoo.com'),
('U0008', 'Oyungerel', 'Personal', '95000888', 'oyungerel@yahoo.com'),
('U0009', 'Munkhbayar', 'Personal', '95000999', 'munkhbayar@yahoo.com'),
('U0010', 'Naranbaatar', 'Personal', '95001010', 'naranbaatar@yahoo.com'),
('U0011', 'Mongol uul uurkhain hk', 'Company', '95001111', 'mongolcompany@yahoo.com'),
('U0012', 'Gots aimag', 'Company', '95001212', 'govi@yahoo.com'),
('U0013', 'Tavantolgoi aimag', 'Company', '95001313', 'tavantolgoi@gmail.com'),
('U0014', 'Orgil LTD', 'Company', '95001414', 'orgil@yahoo.com'),
('U0015', 'Khan LTD', 'Company', '95001515', 'khan@yahoo.com'),
('U0016', 'Mongol khair', 'Company', '95001616', 'mongolhair@yahoo.com'),
('U0017', 'Saruul Export Import', 'Company', '95001717', 'saruul@yahoo.com'),
('U0018', 'Shine khun', 'Company', '95001818', 'shinehun@yahoo.com'),
('U0019', 'Gants erdeneet', 'Company', '95001919', 'gantserdene@yahoo.com'),
('U0020', 'Sanzhaa LTD', 'Company', '95002020', 'sanzhaa@yahoo.com'),
('U0021', 'Mongol monkh', 'Company', '95002121', 'mongolmunkh@yahoo.com'),
('U0022', 'Bayanbayar', 'Personal', '95002222', 'bayanbayar@yahoo.com'),
('U0023', 'Sodnomdariya', 'Personal', '95002323', 'sodnomdariya@yahoo.com'),
('U0024', 'Monhutseg', 'Personal', '95002424', 'monhutseg@yahoo.com'),
('U0025', 'Dolgion', 'Personal', '95002525', 'dolgion@yahoo.com'),
('U0026', 'Bilguun', 'Personal', '95002626', 'bilguun@yahoo.com'),
('U0027', 'Tumencetseg', 'Personal', '95002727', 'tumencetseg@yahoo.com'),
('U0028', 'Narantuya', 'Personal', '95002828', 'narantuya@yahoo.com'),
('U0029', 'Dorjoo', 'Personal', '95002929', 'dorjoo@yahoo.com'),
('U0030', 'Enhtsetseg', 'Personal', '95003030', 'enhtsetseg@yahoo.com');


INSERT INTO software_product (software_id, software_name, software_type) VALUES
('S001', 'Document Manager', 'Document Management'),
('S002', 'Sales Tracker', 'Sales'),
('S003', 'Inventory Manager', 'Inventory'),
('S004', 'Project Planner', 'Project Management'),
('S005', 'Task Manager', 'Task Management'),
('S006', 'Customer Relationship Management', 'CR Management'),
('S007', 'Human Resource Management', 'HR Management');



INSERT INTO salary_log (worker_id, salary_amount, bank_account, bank_type, account_name, transaction_date, STATUS) VALUES
('W0001', 862500.00, 48212334, 'Khan bank', 'Batbayar Tserendorj', CURRENT_TIMESTAMP, TRUE),
('W0002', 880000.00, 49020932, 'TDB', 'Enkhjin Erdenebayar', CURRENT_TIMESTAMP, TRUE),
('W0003', 630000.00, 49873066, 'Golomt bank', 'Ganbold Purevdorj', CURRENT_TIMESTAMP, TRUE),
('W0004', 1380000.00, 45678901, 'State bank', 'Dulmaa Narangerel', CURRENT_TIMESTAMP, TRUE),
('W0005', 990000.00, 56789012, 'Khan bank', 'Tungalag Dorj', CURRENT_TIMESTAMP, TRUE),
('W0006', 1575000.00, 40811178, 'TDB', 'Altangerel Ganbaatar', CURRENT_TIMESTAMP, TRUE),
('W0007', 2100000.00, 45649180, 'Golomt bank', 'Battulga Baasanjav', CURRENT_TIMESTAMP, TRUE),
('W0008', 1050000.00, 47054036, 'State bank', 'Oyungerel Jargalsaikhan', CURRENT_TIMESTAMP, TRUE),
('W0009', 840000.00, 43017333, 'Khan bank', 'Munkhbayar Chuluunbat', CURRENT_TIMESTAMP, TRUE),
('W0010', 1155000.00, 43505032, 'TDB', 'Naranbaatar Batzorig', CURRENT_TIMESTAMP, TRUE);


INSERT INTO list_of_devs (software_id, worker_id) VALUES
('S001', 'W0001'),
('S001', 'W0002'),
('S001', 'W0003'),
('S002', 'W0001'),
('S002', 'W0005'),
('S002', 'W0006'),
('S003', 'W0004'),
('S003', 'W0007'),
('S003', 'W0008'),
('S004', 'W0001'),
('S004', 'W0002'),
('S004', 'W0009'),
('S004', 'W0010'),
('S005', 'W0010'),
('S005', 'W0005');


INSERT INTO user_log (software_id, user_id) VALUES
('S001', 'U0001'),
('S001', 'U0010'),
('S001', 'U0011'),
('S001', 'U0012'),
('S001', 'U0020'),
('S001', 'U0024'),
('S001', 'U0025'),
('S001', 'U0027'),
('S002', 'U0002'),
('S002', 'U0003'),
('S002', 'U0008'),
('S002', 'U0009'),
('S002', 'U0015'),
('S002', 'U0016'),
('S002', 'U0028'),
('S002', 'U0029'),
('S003', 'U0006'),
('S003', 'U0007'),
('S003', 'U0009'),
('S003', 'U0012'),
('S003', 'U0013'),
('S003', 'U0019'),
('S003', 'U0020'),
('S003', 'U0025'),
('S004', 'U0007'),
('S004', 'U0008'),
('S004', 'U0009'),
('S004', 'U0010'),
('S004', 'U0026'),
('S004', 'U0027'),
('S004', 'U0028'),
('S004', 'U0030'),
('S005', 'U0020'),
('S005', 'U0021'),
('S005', 'U0022'),
('S005', 'U0023'),
('S005', 'U0024'),
('S005', 'U0025'),
('S005', 'U0026'),
('S005', 'U0027');


INSERT INTO user_payment_log (software_id, user_id, amount) VALUES
('S001', 'U0001' , 49900),
('S001', 'U0010' , 49900),
('S001', 'U0011' , 49900),
('S001', 'U0012' , 49900),
('S001', 'U0020' , 49900),
('S001', 'U0024' , 49900),
('S001', 'U0025' , 49900),
('S001', 'U0027' , 49900),
('S002', 'U0002' , 59900),
('S002', 'U0003' , 59900),
('S002', 'U0008' , 59900),
('S002', 'U0009' , 59900),
('S002', 'U0015' , 59900),
('S002', 'U0016' , 59900),
('S002', 'U0028' , 59900),
('S002', 'U0029' , 59900),
('S003', 'U0006' , 129900),
('S003', 'U0007' , 129900),
('S003', 'U0009' , 129900),
('S003', 'U0012' , 129900),
('S003', 'U0013' , 129900),
('S003', 'U0019' , 129900),
('S003', 'U0020' , 129900),
('S003', 'U0025' , 129900),
('S004', 'U0007' , 145900),
('S004', 'U0008' , 145900),
('S004', 'U0009' , 145900),
('S004', 'U0010' , 145900),
('S004', 'U0026' , 145900),
('S004', 'U0027' , 145900),
('S004', 'U0028' , 145900),
('S004', 'U0030' , 145900),
('S005', 'U0020' , 109900),
('S005', 'U0021' , 109900),
('S005', 'U0022' , 109900),
('S005', 'U0023' , 109900),
('S005', 'U0024' , 109900),
('S005', 'U0025' , 109900),
('S005', 'U0026' , 109900),
('S005', 'U0027' , 109900);

create user 'test'@'localhost' identified by '123456';
grant all privileges on lab10_dbs.* to 'test'@'localhost';
commit;

-- /* Query */

-- SELECT u.user_name, u.user_type, ul.date_of_subs, sp.software_name
-- FROM user_log ul
-- INNER JOIN users u ON u.user_id = ul.user_id
-- INNER JOIN software_product sp ON sp.software_id = ul.software_id;

-- SELECT u.user_name, u.user_type, ul.date_of_subs, sp.software_name
-- FROM users u
-- LEFT JOIN user_log ul ON u.user_id = ul.user_id
-- LEFT JOIN software_product sp ON sp.software_id = ul.software_id;

-- SELECT u.user_name, u.user_type, ul.date_of_subs, sp.software_name
-- FROM users u
-- RIGHT JOIN user_log ul ON u.user_id = ul.user_id
-- RIGHT JOIN software_product sp ON sp.software_id = ul.software_id;

-- SELECT u.user_name, u.user_type, sp.software_name
-- FROM users u, software_product sp;