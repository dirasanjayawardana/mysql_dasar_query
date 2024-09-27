USE belajar_mysql;

-- LOCKING (proses penguncian data di database, untuk menjaga konsistensi data agar tidak terkena RACE CONDITIION, dimana ketika beberapa user merubah data yang sama)
-- Saat melakukan proses TRANSACTION, data yang diubah otomatis akan di LOCK sampai melakukan COMMIT atau ROLLBACK
-- Untuk melakukan LOCKING secara manual untuk proses SELECT, bisa menggunakan perintah FOR UPDATE dibelakang query SELECT

START TRANSACTION ;

SELECT * FROM guestbooks;

UPDATE guestbooks
SET title = 'Diubah Oleh User 1'
WHERE id = 9;

COMMIT;

-----------------------------------------------------------------------

START TRANSACTION ;

SELECT * FROm products;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE;

UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';

COMMIT ;

#  DEADLOCK (situasi dimana dua proses saling menunggu, namun data yg ditunggu dua-duanya di lock oleh proses lain, sehingga proses menunggu tidak akan pernah selesai)

START TRANSACTION ;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE ;

SELECT * FROM products WHERE id = 'P0002' FOR UPDATE ;

# LOCK TABLE READ

LOCK TABLES products READ;

UPDATE products
SET quantity = 100
WHERE id = 'P0001';

UNLOCK TABLES ;

# LOCK TABLE WRITE

LOCK TABLES products WRITE ;

UPDATE products
SET quantity = 100
WHERE id = 'P0001';

SELECT * FROM products;

UNLOCK TABLES ;

# LOCK INSTANCE

LOCK INSTANCE FOR BACKUP;

UNLOCK INSTANCE;