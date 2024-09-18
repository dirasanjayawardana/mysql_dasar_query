USE belajar_mysql;

SHOW ENGINES; -- melihat engine yang tersedia di database

SHOW TABLES; -- melihat semua tabel

-- membuat tabel baru
CREATE TABLE barang
(
    id     INT          NOT NULL, -- NOT NULL artinya kolom ini tidak boleh bernilai NULL
    nama   VARCHAR(100) NOT NULL,
    harga  INT          NOT NULL DEFAULT 0, -- menambahkan nilai default, untuk timeStamp bisa menggunakan CURRENT_TIMESTAMP atau CURRENT_TIME
    jumlah INT          NOT NULL DEFAULT 0
) ENGINE = InnoDB;

DESCRIBE barang; -- melihat struktur tabel

SHOW CREATE TABLE barang; -- melihat query CREATE tabel

-- update tabel
ALTER TABLE barang
    ADD COLUMN deskripsi TEXT; -- menambah kolom

ALTER TABLE barang
    ADD COLUMN salah TEXT;

ALTER TABLE barang
    DROP COLUMN salah; -- menghapus kolom

ALTER TABLE barang
    MODIFY nama VARCHAR(200) AFTER deskripsi; -- memindahkan posisi kolom nama setelah deskripsi

ALTER TABLE barang
    MODIFY nama VARCHAR(200) FIRST; -- memindahkan kolom nama menjadi yg paling pertama

ALTER TABLE barang
    MODIFY id INT NOT NULL; -- update kolom

ALTER TABLE barang
    MODIFY nama VARCHAR(200) NOT NULL;

SHOW CREATE TABLE barang;

ALTER TABLE barang
    MODIFY jumlah INT NOT NULL DEFAULT 0;

ALTER TABLE barang
    MODIFY harga INT NOT NULL DEFAULT 0;

ALTER TABLE barang
    ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP; -- memberukan nilai default untuk timestamp

-- memasukkan data ke tabel pada kolom tertentu
INSERT INTO barang (id, nama)
VALUES (1, 'Apel');

-- melihat semua data yang ada di tabel
SELECT *
FROM barang;

-- menghapus semua data di dalam tabel, bisa juga menggunakan DELETE FROM nama_tabel
TRUNCATE barang;

SHOW tables;

-- menghapus tabel
DROP TABLE barang;