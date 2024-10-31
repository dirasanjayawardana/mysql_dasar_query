1. COALESCE()
- Fungsi COALESCE() digunakan untuk mengembalikan nilai pertama yang bukan NULL dari serangkaian argumen. Fungsi ini sangat berguna saat Anda ingin mengganti nilai NULL dengan nilai default.
- COALESCE(expression1, expression2, ..., expressionN)
- COALESCE(column_name, 'Default Value')

2. FORMAT()
- Fungsi FORMAT() digunakan untuk memformat angka atau tanggal sesuai dengan format tertentu. Fungsi ini umum di beberapa sistem SQL seperti MySQL dan SQL Server.
- FORMAT(value, format_string [, locale])
- FORMAT(1234567.89, 'N2')

3. CAST()
- Fungsi CAST() digunakan untuk mengkonversi satu tipe data ke tipe data lain. Ini berguna untuk memastikan operasi aritmatika atau string berjalan dengan benar ketika ada perbedaan tipe data.
- CAST(expression AS target_type)
- CAST('123' AS INT)
