-- Active: 1696286365167@@127.0.0.1@3306

-- RELAÇÃO 1:1
CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY(license_id) REFERENCES licenses(id)
);

INSERT INTO licenses VALUES
    ('L001', '11111111', 'B'), 
    ('L002', '22222222', 'A'), 
    ('L003', '33333333', 'AB');

INSERT INTO drivers VALUES
    ('D001', 'Fulano', 'fulano@email.com', '1234', 'L002'),
    ('D002', 'Cicrano', 'cicrano@email.com', '4567', 'L001'),
    ('D003', 'Beltrano', 'beltrano@email.com', '8975', 'L003');

SELECT * FROM licenses;
SELECT * FROM drivers;

SELECT drivers.name, licenses.register_number, licenses.category FROM licenses INNER JOIN drivers ON drivers.license_id = licenses.id;

-- RELAÇÃO 1:N
CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phone(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL, -- não pode ser UNIQUE pois um user pode possuir varios numeros (1:N)
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO users VALUES 
    ( '001','Fulano','fulano@email.com','1234'), 
    ('002','Cicrano','Cicrano@email.com','5678');

INSERT INTO phone VALUES 
    ('p001', '912345678', '002'), 
    ('p002', '900002211', '002'), 
    ('p003', '911110041', '001');

SELECT * FROM users;
SELECT * FROM phone;
DELETE FROM phone;

SELECT users.name, phone.phone_number FROM users INNER JOIN phone ON users.id = phone.user_id WHERE users.name LIKE 'Ci%';

-- EXERCICIO DE FIXAÇAO
