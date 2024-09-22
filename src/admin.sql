-- Auto Increment (mengisi Primary Key secara otomatis dengan angka terakhir +1, AUTO_INCREMENT hanya bisa digunakan di Primary Key)
CREATE TABLE admin
(
    id         INT          NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESCRIBE admin;

INSERT INTO admin(first_name, last_name)
VALUES ('Dira', 'Sanjaya'),
       ('Andi', 'Pratama'),
       ('Deni', 'Saputra');

SELECT * FROM admin ORDER BY id;

DELETE FROM admin WHERE id = 3;

INSERT INTO admin(first_name, last_name)
VALUES ('Rully', 'Hidayat');

-- function melihat Primary Key terakhir di insert
SELECT LAST_INSERT_ID();