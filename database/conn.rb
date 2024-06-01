require "sequel"
require "dotenv/load"
require "json"

begin
  DB = Sequel.connect(ENV["DATABASE_URL"])
  
  DB.transaction do
    existing_data = DB[:siswa].all
    
    DB.drop_table?(:siswa, if_exists: true)
    
    DB.create_table :siswa do
      primary_key :id
      Integer :nis, size: 6, unique: true, default: "666666", null: false
      String :nama, size: 100, null: false
      String :jurusan, size: 255, null: false
      Text :alamat, null: false
      Integer :kelas, size: 2, null: false
    end
    
    if existing_data.any?
      DB[:siswa].multi_insert(existing_data)
    end
    
    puts "Table 'siswa' created successfully."
  end
rescue Sequel::DatabaseError => e
  if e.message.include?("INSERT")
    puts "Error inserting data into the table: #{e.message}"
    File.open("./temp/data_backup.json", "w") do |f|
      f.write(JSON.pretty_generate(existing_data))
    end
  else
    puts "An error occurred: #{e.message}"
  end
rescue Sequel::Error => e
  puts "An error occurred: #{e.message}"
end
