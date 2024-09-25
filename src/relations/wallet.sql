USE belajar_mysql;

-- One to One (tiap data di sebuah tabel hanya boleh berelasi dengan satu data di tabel lainnya)
-- untuk mencegah data duplikat, bisa menggunakan Primary Key yg sama, atau membuat referensi kolom Foreign Key dalam bentuk UNIQUE
CREATE TABLE wallet
(
    id          INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance     INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY id_customer_unique (id_customer),
    FOREIGN KEY fk_wallet_customer (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;

DESCRIBE wallet;

SELECT *
FROM customers;

INSERT INTO wallet(id_customer)
VALUES (1),
       (2);

SELECT *
FROM wallet;

-- JOIN (untuk mengambil data dari beberapa tabel, dengan menentukan kolom yang menjadi referensi di tabel lain)
SELECT customers.email, wallet.balance
FROM wallet
JOIN customers ON (wallet.id_customer = customers.id);