-- membuat user yg dapat mengakses database hanya dari localhost
CREATE USER 'dira'@'localhost';
-- membuat user yg dapat mengakses database dari manapun
CREATE USER 'sanjaya'@'%';

-- menghapus user
DROP USER 'dira'@'localhost';
DROP USER 'sanjaya'@'%';

-- menambahkan hak akses
GRANT SELECT ON belajar_mysql.* TO 'dira'@'localhost';
GRANT SELECT ON belajar_mysql.* TO 'sanjaya'@'%';
GRANT INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'sanjaya'@'%';

-- melihat hak akses user
SHOW GRANTS FOR 'dira'@'localhost';
SHOW GRANTS FOR 'sanjaya'@'%';

-- menghapus hak akses
REVOKE SELECT ON belajar_mysql.* TO 'dira'@'localhost';
REVOKE INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'sanjaya'@'%';

-- mengatur password untuk user
SET PASSWORD FOR 'dira'@'localhost' = 'rahasia';
SET PASSWORD FOR 'sanjaya'@'%' = 'rahasia';
