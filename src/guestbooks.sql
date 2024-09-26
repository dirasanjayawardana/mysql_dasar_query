USE belajar_mysql;

-- Set Operator (operasi antara hasil dari dua SELECT query)
-- Jenis-jenis Set Operator (UNION, UNIONALL, INTERSEC, MINUS)
CREATE TABLE guestbooks
(
    id      INT NOT NULL AUTO_INCREMENT,
    email   VARCHAR(100),
    title   VARCHAR(200),
    content TEXT,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

SELECT *
FROM customers;

INSERT INTO guestbooks(email, title, content)
VALUES ('guest@gmail.com', 'Hello', 'Hello'),
       ('guest2@gmail.com', 'Hello', 'Hello'),
       ('guest3@gmail.com', 'Hello', 'Hello'),
       ('dira@gmail.com', 'Hello', 'Hello'),
       ('dira@gmail.com', 'Hello', 'Hello'),
       ('dira@gmail.com', 'Hello', 'Hello');

SELECT *
FROM guestbooks;

-- UNION (menggabungkan hasil dua buah query SELECT, jika terdapat data yang duplikat, data duplikatnya akan dihapus dari salah satu hasil query, artinya data yg duplikat akan di merge jadi satu)
SELECT email
FROM customers
UNION
SELECT email
FROM guestbooks;

-- UNION ALL (menggabungkan hasil dua buah query SELECt, jika terdapat data duplikat, tetap akan di tampilkan semua)
SELECT email
FROM customers
UNION ALL
SELECT email
FROM guestbooks;

-- SubQuery (membuat query lain di dalam query utama)
-- SubQuery bisa digunakan di WHERE maupun di FROM, sebagai pengganti data rujukan
SELECT emails.email, COUNT(emails.email)
FROM (SELECT email
      FROM customers
      UNION ALL
      SELECT email
      FROM guestbooks) as emails
GROUP BY emails.email;

-- INTERSEC (menggabungkan dua query, namun hanya mengambil data yg terdapat di query pertama dan kedua, mirip seperti INNER JOIN)
-- Di MySql tidak memiliki perintah INTERSEC, bisa menggugakan SubQuery atau bisa menggunakan JOIN
SELECT DISTINCT email
FROM customers
WHERE email IN (SELECT DISTINCT email FROM guestbooks);

SELECT DISTINCT customers.email
FROM customers
         INNER JOIN guestbooks ON (guestbooks.email = customers.email);

-- MINUS (data query pertama akan dihilangkan oleh query kedua ketika ada data yang sama)
-- Di MySql juga tidak ada perintah MINUS, bisa menggunakan LEFT JOIN dan filter WHERE
SELECT DISTINCT customers.email, guestbooks.email
FROM customers
         LEFT JOIN guestbooks ON (customers.email = guestbooks.email)
WHERE guestbooks.email IS NULL;