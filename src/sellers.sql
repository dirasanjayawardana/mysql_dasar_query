-- INDEX (ketika menggunakan INDEX pada suatu kolom, data akan disimpan dalam struktur B-Tree, ini akan mempercepat proses pencarian data berdasarkan data di kolom tersebut, namun akan memperlambat ketika melakukan manipulasi data)
-- Untuk PRIMARY KEY dan UNIQUE secara default sudah menggunakan INDEX
-- INDEX nama_index (kolom) atau INDEX nama_index (kolom1, kolom2, kolom3)
CREATE TABLE sellers
(
    id    INT          NOT NULL AUTO_INCREMENT,
    name  VARCHAR(100) NOT NULL,
    name2 VARCHAR(100) ,
    name3 VARCHAR(100) ,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email),
    INDEX name_index (name),
    INDEX name2_index (name2),
    INDEX name3_index (name3),
    INDEX name1_name2_name3_index (name, name2, name3)
) ENGINE = InnoDB;

DESC sellers;

SHOW CREATE TABLE sellers;

SELECT * FROM sellers WHERE name = 'X';

SELECT * FROM sellers WHERE name = 'X' AND name2 = 'X';

SELECT * FROM sellers WHERE name2 = 'X';

SELECT * FROM sellers WHERE name = 'X' AND name2 = 'X' AND name3 = 'X';

ALTER TABLE sellers
DROP INDEX name_index;