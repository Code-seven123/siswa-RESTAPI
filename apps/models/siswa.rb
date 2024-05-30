require_relative "../../database/conn"

class Siswa < Sequel::Model(:siswa)
  plugin :timestamps
end
