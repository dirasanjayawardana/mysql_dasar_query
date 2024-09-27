USE belajar_mysql;

-- Transaction (saat menjalankan query ke database, perintah yg dijalankan bisa lebih dari satu, jika salah satu perintah gagal dijalankan, harapannya perintah-perintah sebelumnya bisa dibatalkan, untuk menjaga data agar tetap konsisten)
-- Transaction adalah fitur yg memungkinkan beberapa perintah dianggap menjadi satu kesatuan, jika terdapat satu perintah gagal, maka otomatis perintah-perintah sebelumnya akan dibatalkan/rollback

-- START TRANSACTION --> Perintah-perintah Query --> COMMIT (menyimpan secara permanen di database) / ROLLBACK (membatalkan perintah query)

-- Fitur DDL (Data Definition Language, fitur untuk merubah struktur tabel) tidak bisa menggunakan fitur Transaction
-- Fitur DML (Data Manipulation Language, fitur untuk merubah isi data di tabel) bisa menggunakan fitur Transaction

START TRANSACTION;

INSERT INTO guestbooks (email, title, content)
VALUES ('contoh@gmail.com', 'Contoh', 'Contoh'),
       ('contoh2@gmail.com', 'Contoh', 'Contoh'),
       ('contoh3@gmail.com', 'Contoh', 'Contoh');

SELECT *
FROM guestbooks;

COMMIT;

---------------------------------------------------------------------------

START TRANSACTION;

DELETE
FROM guestbooks;

SELECT *
FROM guestbooks;

ROLLBACK;