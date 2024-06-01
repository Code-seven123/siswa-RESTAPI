require 'httparty'
require "json"
require "uri"
# Data yang akan dikirim dalam format JSON
data = {
  nis: "888888",
  nama: "John",
  jurusan: "Teknik Informatika",
  alamat: "Jl. Contoh No. 123",
  kelas: 11
}
# URL yang dituju
url = "http://localhost:4567/siswa"#ByNis?#{URI.encode_www_form(data)}"

# Melakukan permintaan PUT dengan data yang diberikan
response = HTTParty.put(url, body: data.to_json, headers: { 'Content-Type' => 'application/json' })

# Mengecek respons
puts "Status code: #{response.code}"
puts "Response body: #{response.body}"
