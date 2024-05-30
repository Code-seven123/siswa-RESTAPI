require 'httparty'
require "json"
require "uri"
# Data yang akan dikirim dalam format JSON
data = {
  nis: "123253",
  nama: "John",
  jurusan: "Teknik Informatika",
  alamat: "Jl. Contoh No. 123",
  kelas: 11
}
# URL yang dituju
id = 8
url = "http://localhost:9292/siswa/d/#{id}" # {URI.encode_www_form(data)}"

# Melakukan permintaan PUT dengan data yang diberikan
response = HTTParty.delete(url, headers: { 'Content-Type' => 'application/json' })

# Mengecek respons
puts "Status code: #{response.code}"
puts "Response body: #{response.body}"
