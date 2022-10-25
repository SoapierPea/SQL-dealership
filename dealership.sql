DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150),
    phone_number VARCHAR(15),
    age INTEGER
);
DROP TABLE IF EXISTS staff CASCADE;
CREATE TABLE staff(
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(150),
    phone_number VARCHAR(15),
    age INTEGER
);
DROP TABLE IF EXISTS car CASCADE;
CREATE TABLE car(
    car_id SERIAL PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    color VARCHAR(50),
    price INTEGER
);
DROP TABLE IF EXISTS sale CASCADE;
CREATE TABLE sale(
    sale_id SERIAL PRIMARY KEY,
    staff_id INTEGER,
    customer_id INTEGER,
    car_id INTEGER,
    FOREIGN KEY(staff_id) REFERENCES staff(staff_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(car_id) REFERENCES car(car_id)
);
DROP TABLE IF EXISTS inventory CASCADE;
CREATE TABLE inventory(
    inventory_id SERIAL PRIMARY KEY,
    car_id INTEGER,
    car_count INTEGER,
    FOREIGN KEY(car_id) REFERENCES car(car_id)
);
DROP FUNCTION add_customer;
CREATE OR REPLACE FUNCTION add_customer(
    _first_name VARCHAR(50),
    _last_name VARCHAR(50),
    _email VARCHAR(150),
    _phone_number VARCHAR(15),
    _age INTEGER
)
RETURNS void
AS
$$
BEGIN
    INSERT INTO customer(first_name, last_name, email, phone_number, age)
    VALUES(_first_name, _last_name, _email, _phone_number, _age);
END;
$$
LANGUAGE plpgsql;
SELECT add_customer('Shmarco', 'Valuche', 'shvaluche@email.com', '3847632', 30);
SELECT add_customer('Caleed', 'Schmilk', 'cschmilk@email.com', '3847633', 17);
SELECT add_customer('CONAR', 'The Great', 'greatCONAR@conmail.com', '3847634', 31);
SELECT add_customer('Marcus', 'K. Maga', 'MKMAGA@america.com', '07021776',  245);
SELECT add_customer('Dylard', 'Dukes', 'ddukes@email.com', '6354788521', 33);
SELECT *
FROM customer;
DROP FUNCTION add_staff;
CREATE OR REPLACE FUNCTION add_staff(
    _first_name VARCHAR(50),
    _last_name VARCHAR(50),
    _email VARCHAR(150),
    _phone_number VARCHAR(15),
    _age INTEGER
)
RETURNS void
AS
$$
BEGIN
    INSERT INTO staff(first_name, last_name, email, phone_number, age)
    VALUES(_first_name, _last_name, _email, _phone_number, _age);
END;
$$
LANGUAGE plpgsql;
SELECT *
FROM staff;
SELECT add_staff('Bot','Ro','ro.Bot@email.com','00000001', 01);
SELECT add_staff('Bot2','Ro2','ro.Bot2@email.com','00000002', 02);
SELECT add_staff('Bot3','Ro3','ro.Bot3@email.com','00000003', 03);
SELECT add_staff('Bot4','Ro4','ro.Bot4@email.com','00000004', 04);
SELECT add_staff('Bot5','Ro5','ro.Bot5@email.com','00000005', 05);
DROP FUNCTION add_car;
CREATE OR REPLACE FUNCTION add_car(
    _make VARCHAR(50),
    _model VARCHAR(50),
    _color VARCHAR(50),
    _price INTEGER
)
RETURNS void
AS
$$
BEGIN
    INSERT INTO car(make, model, color, price)
    VALUES(_make, _model, _color, _price);
END;
$$
LANGUAGE plpgsql;
SELECT add_car('Honda','CRV','Blue', 24000);
SELECT add_car('Honda','HR-V','Gray', 30900);
SELECT add_car('Honda','Pilot','Black', 38900);
SELECT add_car('Honda','Passport','Black', 41999);
SELECT add_car('Honda','Civic Sedan','Blue', 24999);
SELECT *
FROM car;
DROP FUNCTION add_inventory;
CREATE OR REPLACE FUNCTION add_inventory(
    _car_id INTEGER,
    _car_count INTEGER
)
RETURNS void
AS
$$
BEGIN
    INSERT INTO inventory(car_id, car_count)
    VALUES(_car_id, _car_count);
END;
$$
LANGUAGE plpgsql;
SELECT add_inventory(1,12);
SELECT add_inventory(2,15);
SELECT add_inventory(3,20);
SELECT add_inventory(4,14);
SELECT add_inventory(5,8);
SELECT *
FROM inventory;
DROP FUNCTION add_sale;
CREATE OR REPLACE FUNCTION add_sale(
    _staff_id INTEGER,
    _customer_id INTEGER,
    _car_id INTEGER
)
RETURNS void
AS
$$
BEGIN
    INSERT INTO sale(staff_id, customer_id, car_id)
    VALUES(_staff_id, _customer_id, _car_id);
END;
$$
LANGUAGE plpgsql;
SELECT add_sale(1,1,1);
SELECT add_sale(2,2,2);
SELECT add_sale(3,3,3);
SELECT add_sale(4,4,4);
SELECT add_sale(5,5,5);
SELECT *
FROM sale;