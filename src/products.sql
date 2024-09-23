USE belajar_mysql;

-- membuat tabel products
CREATE TABLE products
(
    id          VARCHAR(10)  NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    price       INT UNSIGNED NOT NULL, -- UNSIGNED artinya data tidak boleh negatif
    quantity    INT UNSIGNED NOT NULL DEFAULT 0,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP -- menetapkan default value waktu sekarang untuk TIMESTAMP
) ENGINE = InnoDB;

-- melihat semua tabel
SHOW TABLES;

-- melihat struktur tabel products
DESCRIBE products;

-- memasukkan data ke products pada kolom tertentu
INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);

INSERT INTO products(id, name, description, price, quantity)
VALUES ('P0002', 'Mie Ayam Bakso', 'Mie Ayam Original + Bakso', 20000, 100);

INSERT INTO products(id, name, price, quantity)
VALUES ('P0003', 'Mie Ayam Ceker', 20000, 100),
       ('P0004', 'Mie Ayam Spesial', 25000, 100),
       ('P0005', 'Mie Ayam Yamin', 15000, 100);

-- melihat semua data di tabel products
SELECT *
FROM products;

-- melihat data di tabel products untuk kolom tertentu
SELECT id, name, price, quantity
FROM products;

SELECT name, quantity, id
FROM products;

-- update tabel products, menambahkan kolom id sebagai primary key (identifier)
ALTER TABLE products
    ADD PRIMARY KEY (id);

DESCRIBE products;

-- melihat struktur CREATE tabel products
SHOW CREATE TABLE products;

INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);

-- mengambil data sesuai dengan filter WHERE
-- pada MySql defaultnya case insensitive (tidak memperdulikan huruf besar atau kecil)
SELECT *
FROM products
WHERE quantity = 100;

SELECT *
FROM products
WHERE price = 15000;

SELECT *
FROM products
WHERE id = 'P0001';

SELECT *
FROM products
WHERE name = 'mie ayam bakso';

DESCRIBE products;

-- update tabel products, menambahkan kolom category yang berisi enum (hanya boleh diisi data tertentu)
ALTER TABLE products
    ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-Lain')
        AFTER name;

SELECT *
FROM products;

SELECT *
FROM products
WHERE id = 'P0001';

-- update isi tabel, merubah isi kolom category, sesuai dengan data yang difilter dengan WHERE
UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001';

UPDATE products
SET category    = 'Makanan',
    description = 'Mie Ayam Original + Ceker'
WHERE id = 'P0003';

-- update isi tabel dengan mengambil exsisting data sebelumnya
UPDATE products
SET price = price + 5000
WHERE id = 'P0005';

INSERT INTO products(id, name, price, quantity)
VALUES ('P0009', 'Mie Ayam Original', 15000, 100);

-- menghapus data semusai filter WHERE
DELETE
FROM products
WHERE id = 'P0009';

-- mengambil data dengan nama alias kolom
SELECT id       AS Kode,
       name     AS Nama,
       category AS Kategori,
       price    AS Harga,
       quantity AS Jumlah
FROM products;

-- menggunakan alias tabel
SELECT p.id       AS Kode,
       p.name     AS Nama,
       p.category AS Kategori,
       p.price    AS Harga,
       p.quantity AS Jumlah
FROM products AS p;

INSERT INTO products(id, category, name, price, quantity)
VALUES ('P0006', 'Makanan', 'Bakso Rusuk', 25000, 200),
       ('P0007', 'Minuman', 'Es Jeruk', 10000, 300),
       ('P0008', 'Minuman', 'Es Campur', 15000, 500),
       ('P0009', 'Minuman', 'Es Teh Manis', 5000, 400),
       ('P0010', 'Lain-Lain', 'Kerupuk', 2500, 1000),
       ('P0011', 'Lain-Lain', 'Keripik Udang', 10000, 300),
       ('P0012', 'Lain-Lain', 'Es Krim', 5000, 200),
       ('P0013', 'Makanan', 'Mie Ayam Jamur', 20000, 50),
       ('P0014', 'Makanan', 'Bakso Telor', 20000, 150),
       ('P0015', 'Makanan', 'Bakso Jando', 25000, 300);

-- operator perbandingan (>, >=, != atau <>, <, <=)
SELECT *
FROM products
WHERE quantity > 100;

SELECT *
FROM products
WHERE quantity >= 100;

SELECT *
FROM products
WHERE category != 'Makanan';

SELECT *
FROM products
WHERE category <> 'Minuman';

-- operator AND & OR (menggabungkan dua atau lebih operator, secara default AND menjadi prioritas utama yang dieksekusi, untuk merubah prioritas eksekusi, bisa gunakan tanda ())
SELECT *
FROM products
WHERE quantity > 100
  AND price > 20000;

SELECT *
FROM products
WHERE category = 'Makanan'
  AND price < 20000;

SELECT *
FROM products
WHERE quantity > 100
   OR price > 20000;

SELECT *
FROM products
WHERE (category = 'Makanan' OR quantity > 500)
  AND price > 20000;

-- operator LIKE & NOT LIKE (mencari data yang mengandung isi String dari LIKE, operator ini lambat, tidak disarankan untuk data besar, operator ini tidak case sensitive)
SELECT *
FROM products
WHERE name LIKE '%mie%';

SELECT *
FROM products
WHERE name LIKE '%bakso%';

SELECT *
FROM products
WHERE name NOT LIKE '%bakso%';

-- operator IS NULL & IS NOT NULL (digunakan khusus untuk mengecek data NULL)
SELECT *
FROM products
WHERE description IS NULL;

SELECT *
FROM products
WHERE description IS NOT NULL;

-- operator BETWEEN & NOT BETWEEN (mencari data >= dan <= pada range tertentu)
SELECT *
FROM products
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM products
WHERE price NOT BETWEEN 10000 AND 20000;

-- operator IN & NOT IN (mencari data dari sekumpulan beberapa nilai)
SELECT *
FROM products
WHERE category IN ('Makanan', 'Minuman');

SELECT *
FROM products
WHERE category NOT IN ('Makanan', 'Minuman');

-- ORDER BY ASC & ORDER BY DESC (mengurutkan data berdasarkan kolom yang dipilih, bisa diurutkan dengan mengacu pada beberapa kolom, defaultnya ASC)
SELECT id, category, name
FROM products
ORDER BY category;

SELECT id, category, price, name
FROM products
ORDER BY category ASC, price DESC;

-- LIMIT jumlah & LIMIT skip, jumlah (membatasi jumlah data yang diambil, dan men-skip data yang tidak ingin diambil atau disebut dengan OFFSET)
SELECT *
FROM products
ORDER BY id
LIMIT 5;

SELECT *
FROM products
ORDER BY id
LIMIT 3;

SELECT *
FROM products
ORDER BY id
LIMIT 0, 5;

SELECT *
FROM products
ORDER BY id
LIMIT 5, 5;

SELECT *
FROM products
ORDER BY id
LIMIT 10, 5;

-- DISTINC (mengambil data dengan menghilangkan data yg duplikat dari hasil query)
SELECT DISTINCT category
FROM products;

-- Arithmetic Operator (%, MOD, *, +, -, / (pembagian yg hasilnya bisa Float), DIV (pembagian yg hasilnya akan selalu Integer))
SELECT 10, 10, 10 * 10 as Hasil;

SELECT id, name, price, price DIV 1000 AS 'Price in K'
FROM products;

-- Mathematical Function (fungsi untuk mengitung nilai, SIN(), COS(), TAN(), ABS(), LN(), PI(), MOD(), LOG(), POWER(nilai, pangkat), dll)
SELECT id, COS(price), SIN(price), TAN(price)
FROM products;

SELECT id, name, price
FROM products
WHERE (price DIV 1000) > 15;

-- String Function (untuk manipulasi data String, LOWER(), UPPER(), LENGTH(), TRIM(), dll)
SELECT id,
       LOWER(name)  as 'Name Lower',
       UPPER(name)  as 'Name Upper',
       LENGTH(name) as 'Name Length'
FROM products;

-- Date and Time Function (untuk manipulasi data waktu, EXTRACT(), YEAR(), MONTH())
SELECT id,
       created_at,
       EXTRACT(YEAR FROM created_at)  as Year,
       EXTRACT(MONTH FROM created_at) as Month
FROM products;

SELECT id, created_at, YEAR(created_at), MONTH(created_at)
FROM products;

-- Percabangan CASE WHEN THEN (mirip switch case)
SELECT id,
       category,
       CASE category
           WHEN 'Makanan' THEN 'Enak'
           WHEN 'Minuman' THEN 'Segar'
           ELSE 'Apa Itu?'
       END AS 'Category'
FROM products;

-- Percabangan IF(kondisi, value, nextIf/else)
SELECT id,
       price,
       IF(price <= 15000, 'Murah', 
       IF(price <= 20000, 'Mahal', 
       'Mahal Banget')) as 'Mahal?'
FROM products;

-- IFNULL(data, value) (mengecek apakah data NULL, jika NULL maka akan diisi dengan value)
SELECT id, name, IFNULL(description, 'Kosong')
FROM products;

-- Aggregate Function - memperoleh suatu data dari beberapa data (COUNT(), MAX(), MIN(), AVG(), SUM())
-- Ketika menggunakan Aggregate Function, tidak bisa digabungkan dengan SELECT kolom lainnya, kecuali menggunakan GROUP BY
SELECT COUNT(id) as 'Total Product'
FROM products;

SELECT MAX(price) as 'Product Termahal'
FROM products;

SELECT MIN(price) as 'Product Termurah'
FROM products;

SELECT AVG(price) as 'Rata-Rata Harga'
FROM products;

SELECT SUM(quantity) AS 'Total Stock'
FROM products;

-- GROUP BY (mengelompokkan data berdasarkan kriteria tertentu, data yang sama akan dianggap sebagai satu group)
-- GROUP BY hanya bisa dilakukan ketika menggunakan Aggregate Function
SELECT COUNT(id) as 'Total Product', category, price
FROM products
GROUP BY category, price;

SELECT MAX(price) as 'Product Termahal', category
FROM products
GROUP BY category;

SELECT MIN(price) as 'Product Termurah', category
FROM products
GROUP BY category;

SELECT AVG(price) as 'Rata-Rata Harga', category
FROM products
GROUP BY category;

SELECT SUM(quantity) AS 'Total Stock', category
FROM products
GROUP BY category;

-- HAVING (untuk melakukan filter data sesuai dengan hasil Aggregate Function)
SELECT COUNT(id) as total,
       category
FROM products
GROUP BY category
HAVING total > 2;

SELECT *
FROM products;

INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0016', 'Permen', 'Lain-Lain', 500, 1000);

UPDATE products
SET price = 1000
WHERE id = 'P0016';

-- CONSTRAINT nama_constraint JENISCONSTRAINT (menambahkan validasi untuk setiap data yang masuk)
-- UNIQUE (kolom)
-- CHECK (kondisi)
ALTER TABLE products
    ADD CONSTRAINT price_check CHECK ( price >= 1000 );

SHOW CREATE TABLE products;

INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0017', 'Permen Lagi', 'Lain-Lain', 500, 1000);

UPDATE products
SET price = 500
WHERE id = 'P0016';

-- FULLTEXT Search (digunakan untuk mencari sebagian data di kolom dengan tipe data String, mirip seperti LIKE namun lebih cepat, karena FULLTEXT menggunakan INDEX)
-- FULLTEXT nama_fitur (kolom1, kolom2)
-- FULLTEXT ada tiga mode, NATURAL LANGUAGE MODE, BOOLEAN MODE, WITH QUERY EXPANSION
ALTER TABLE products
    ADD FULLTEXT product_fulltext (name, description);

ALTER TABLE products
    DROP INDEX product_fulltext;

SHOW CREATE TABLE products;

SELECT *
FROM products
WHERE name LIKE '%ayam%'
   OR description LIKE '%ayam%';

-- NATURAL LANGUAGE (mencari per kata)
SELECT *
FROM products
WHERE MATCH(name, description)
            AGAINST('ayam' IN NATURAL LANGUAGE MODE);

-- BOOLEAN (+ mencari yg mengandung kata, - mencari yg tidak mengandung kata)
SELECT *
FROM products
WHERE MATCH(name, description)
            AGAINST('+ayam -bakso' IN BOOLEAN MODE);

-- QUERY EXPANSION (seperti NATURAL LANGUAGE, namun melakukan pencarian dua kali, pencarian pertama menggunakan NATURAL LANGUAGE, pencarian kedua melakukan pencarian dari kedekatan hasil pertama)
SELECT *
FROM products
WHERE MATCH(name, description)
            AGAINST('bakso' WITH QUERY EXPANSION);

DESC products;

SELECT *
FROM products;

INSERT INTO products(id, name, category, price, quantity)
VALUES ('Pxxxx', 'Contoh', 'Lain-Lain', 1000, 1000);

INSERT INTO products(id, name, price, quantity)
VALUES ('X0001', 'X Satu', 25000, 200),
       ('X0002', 'X Dua', 10000, 300),
       ('X0003', 'X Tiga', 15000, 500);

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT MAX(price)
FROM products;

SELECT *
FROM products;

SELECT MAX(cp.price)
FROM (SELECT price
      FROM categories
               JOIN products ON (products.id_category = categories.id)) as cp;

UPDATE products
SET price=1000000
WHERE id = 'X0003';