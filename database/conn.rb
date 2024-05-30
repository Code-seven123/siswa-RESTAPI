require "sequel"
require "dotenv/load"

begin
  DB = Sequel.connect(ENV["DATABASE_URL"])
  DB.create_table? :siswa do
    primary_key :id
    Integer :nis, size: 6, unique: true, default: "111111", null: false
    String :nama, size: 100, null: false
    String :jurusan, size: 255, null: false
    Text :alamat, null: false
    Integer :kelas, size: 2, null: false
  end
rescue Sequel::DatabaseConnectionError => e
  puts "Error connecting to the database: #{e.message}"
rescue Sequel::DatabaseDisconnectError => e
  puts "Database connection lost: #{e.message}"
rescue Sequel::Error => e
  puts "An error occurred: #{e.message}"
rescue Sequel::DatabaseError => e
  puts "Error creating database: #{e.message}"
rescue Sequel::Error => e
  puts "Error creating model: #{e.message}"
end

