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

### Database
- `SHOW DATABASES;` melihat semua database
- `CREATE DATABASE nama_database;` membuat database baru
- `DROP DATABASE nama_database;` menghapus database
- `USE nama_database` memilih database/masuk ke database