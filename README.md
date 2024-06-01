# API Documentation

## Delete Controller

### DELETE /siswa/dn/:nis

Menghapus data siswa berdasarkan NIS.

**Request Parameters**
- `:nis` (Path Parameter): Nomor Induk Siswa (NIS) yang akan dihapus.

**Response**
- `200 OK`: Jika data berhasil dihapus.
- `404 Not Found`: Jika data tidak ditemukan dalam database.
- `422 Unprocessable Entity`: Jika parameter tidak valid.
- `500 Internal Server Error`: Jika terjadi kesalahan server.

### DELETE /siswa/d/:id

Menghapus data siswa berdasarkan ID.

**Request Parameters**
- `:id` (Path Parameter): ID siswa yang akan dihapus.

**Response**
- `200 OK`: Jika data berhasil dihapus.
- `404 Not Found`: Jika data tidak ditemukan dalam database.
- `422 Unprocessable Entity`: Jika parameter tidak valid.
- `500 Internal Server Error`: Jika terjadi kesalahan server.

## Search Controller

### GET /siswa/nama/:nama

Mencari data siswa berdasarkan nama.

**Request Parameters**
- `:nama` (Path Parameter): Nama siswa yang akan dicari.

**Response**
- `202 Accepted`: Jika pencarian berhasil.
- `400 Bad Request`: Jika parameter tidak valid.
- `404 Not Found`: Jika data siswa tidak ditemukan.
- `500 Internal Server Error`: Jika terjadi kesalahan server.

### GET /siswa/alamat/:alamat

Mencari data siswa berdasarkan alamat.

**Request Parameters**
- `:alamat` (Path Parameter): Alamat siswa yang akan dicari.

**Response**
- `202 Accepted`: Jika pencarian berhasil.
- `400 Bad Request`: Jika parameter tidak valid.
- `404 Not Found`: Jika data siswa tidak ditemukan.
- `500 Internal Server Error`: Jika terjadi kesalahan server.

### GET /siswa/kelas/:kelas

Mencari data siswa berdasarkan kelas.

**Request Parameters**
- `:kelas` (Path Parameter): Kelas siswa yang akan dicari.

**Response**
- `202 Accepted`: Jika pencarian berhasil.
- `400 Bad Request`: Jika parameter tidak valid.
- `404 Not Found`: Jika data siswa tidak ditemukan.
- `500 Internal Server Error`: Jika terjadi kesalahan server.

### GET /siswa/id/:id

Mencari data siswa berdasarkan ID.

**Request Parameters**
- `:id` (Path Parameter): ID siswa yang akan dicari.

**Response**
- `202 Accepted`: Jika pencarian berhasil.
- `400 Bad Request`: Jika parameter tidak valid.
- `404 Not Found`: Jika data siswa tidak ditemukan.
- `500 Internal Server Error`: Jika terjadi kesalahan server.

### GET /siswa/nis/:nis

Mencari data siswa berdasarkan NIS.

**Request Parameters**
- `:nis` (Path Parameter): NIS siswa yang akan dicari.

**Response**
- `202 Accepted`: Jika pencarian berhasil.
- `400 Bad Request`: Jika parameter tidak valid.
- `404 Not Found`: Jika data siswa tidak ditemukan.
- `500 Internal Server Error`: Jika terjadi kesalahan server.

### GET /siswa/jurusan/:jurusan

Mencari data siswa berdasarkan jurusan.

**Request Parameters**
- `:jurusan` (Path Parameter): Jurusan siswa yang akan dicari.

**Response**
- `202 Accepted`: Jika pencarian berhasil.
- `400 Bad Request`: Jika parameter tidak valid.
- `404 Not Found`: Jika data siswa tidak ditemukan.
- `500 Internal Server Error`: Jika terjadi kesalahan server.

## Update Controller

### POST /siswa/update/:id

Memperbarui data siswa berdasarkan ID.

**Request Parameters**
- `:id` (Path Parameter): ID siswa yang akan diperbarui.

**Response**
- `200 OK`: Jika pembaruan berhasil.
- `404 Not Found`: Jika data siswa tidak ditemukan dalam database.
- `422 Unprocessable Entity`: Jika parameter tidak valid.
- `500 Internal Server Error`: Jika terjadi kesalahan server.

## Create Controller

### PUT /siswa

Menambahkan data siswa baru.

**Request Body**
- Data siswa baru dalam format JSON.

**Response**
- `201 Created`: Jika penambahan data berhasil.
- `204 No Content`: Jika data body tidak ditemukan.
- `422 Unprocessable Entity`: Jika data yang diterima tidak valid.
- `500 Internal Server Error`: Jika terjadi kesalahan server.
