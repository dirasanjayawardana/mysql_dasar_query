# Database Management System (DBMS)
- DBMS adalah sebuah aplikasi untuk melakukan management data
- DBMS biasanya berjalan sebagai aplikasi yg berbasis server, perintah akan dikirimkan ke DBMS untuk melakukan management data atau melakukan CRUD (create, read, update, delete)
- Contoh DBMS antara lain: MySQL, Oracle, PostgreSQL, dll

## Jenis-jenis Database
- Relational database (berbentuk tabel)
- Key-Value database (berbentu key-value, seperti dictionary)
- Document databse (biasanya dalam bentuk JSON)

## SQL (Structure Query Language)
- SQL merupakan perintah standar yang digunakan untuk melakukan management data
- SQL adalah bahasa yang digunakan untuk mengirim perintah ke DBMS
- Cara masuk MySQL via terminal di windows `mysql -uroot -p`, pastikan sudah menambahkan path bin directory MySQL di environment variabel, pastikan MySQL sudah di running di service

## Database
- `SHOW DATABASES;` melihat semua database
- `CREATE DATABASE nama_database;` membuat database baru
- `DROP DATABASE nama_database;` menghapus database
- `USE nama_database;` memilih database/masuk ke database

### Tipe Data Number
- `Integer` TINYINT(1 Byte), SMALLINT(2 Byte), MEDIUMINT(3 Byte), INT(4 Byte), BIGINT(8 Byte)
- `Floating Point` FLOAT(4 Byte), DOUBLE(8 Byte)
- `DECIMAL(length, scale)` Tipe data number yang bisa diatur berapa digitnya dan berapa angka belakang koma
- `TIPEDATANYA(N)` Membuat tipe data number sejumlah N digit
- `ZEROFILL` akan mengisi digit otomatis dengan 0, contoh `INT(3) ZEROFILL` maka angka 1 akan ditampilkan 001

### Tipe Data String
- `CHAR(N)` atau `VARCHAR(N)` Membuat tipe data String dengan panjang karakter tertentu, maksimalnya 65535 karakter
- Bedanya antara CHAR dan VARCHAR adalah pada ukuran penyimpanannya, pada `CHAR(4)` jika ukuran didefinisikan 4 karakter, maka akan memakan space sebesar 4 bytes, meskipun tidak diisi, sedangkan pada `VARCHAR(4)` meskipun didefinisikan 4 karakter, akan memakan space sesuai isinya, jika isinya hanya 1 karakter, hanya akan memakan space 1 byte
- `TEXT` TINYTEXT(maks 255 karakter), TEXT(maks 65535 karakter), MEDIUMTEXT(maks 16MB), LONGTEXT(maks 4GB)
- `ENUM` Merupakan tipe data String yang bisa ditentukan pilihan isinya, contoh `ENUM('Pria', 'Wanita')`

### Tipe Data Date and Time
- `DATE` YYYY-MM-DD
- `DATETIME` YYYY-MM-DD HH:MM:SS
- `TIMESTAMP` YYYY-MM-DD HH:MM:SS, TIMESTAMP leih ditujukan untuk informasi tambahan
- `TIME` HH:MM:SS
- `YEAR` YYYY

### Tipe Data Boolean
- `BOOLEAN` true or false, bisa juga TRUE or FALSE
- Di MySQL tidak case sensitive


## Learning
- barang.sql
- products.sql
- admin.sql
- customers.sql
- sellers.sql