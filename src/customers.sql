-- CONSTRAINT nama_constraint JENISCONSTRAINT (menambahkan validasi untuk setiap data yang masuk)
-- UNIQUE (kolom)
-- CHECK (kondisi)
CREATE TABLE customers
(
    id         INT          NOT NULL AUTO_INCREMENT,
    email      VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email)
) ENGINE = InnoDB;

DESCRIBE customers;

ALTER TABLE customers
DROP CONSTRAINT email_unique;

ALTER TABLE customers
ADD CONSTRAINT email_unique UNIQUE (email);

INSERT INTO customers(email, first_name, last_name)
VALUES ('dira@gmail.com', 'Dira', 'Sanjaya');

SELECT * FROM customers;

INSERT INTO customers(email, first_name, last_name)
VALUES ('sanjaya@gmail.com', 'Dira', 'Sanjaya');

DESC customers;