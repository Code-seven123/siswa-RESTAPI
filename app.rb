require "dotenv/load"
require "sinatra"
require "./database/conn"
require "json"
require 'dry-validation'

class SiswaValidator < Dry::Validation::Contract
  params do
    required(:nis).value(:integer)
    required(:nama).value(:string)
    required(:jurusan).value(:string)
    required(:alamat).value(:string)
    required(:kelas).value(:integer)
  end

  rule(:nis) do
    key.failure("Must have a length of 6") unless value.to_s.length == 6
  end

  rule(:nama) do
    key.failure("The data is too long, it should not exceed 100") if value.length > 100
  end
end
class NisValidator < Dry::Validation::Contract
  params do
    required(:nis).value(:integer)
  end
  rule(:nis) do
    key.failure("Must have a length of 6") unless value.to_s.length == 6
  end
end

before do
  content_type :json
end
get "/" do
  status 200
  { "msg" => "Hello world!" }.to_json
end

put "/siswa" do
  begin
    request_body = request.body.read
    if request_body.empty?
      halt 204, { errors: "data body not found" }.to_json
    end

    siswaValidate = SiswaValidator.new
    result = siswaValidate.call(JSON.parse(request_body))

    if result.success?
      siswa = Siswa.new(
        nis: result[:nis],
        nama: result[:nama],
        jurusan: result[:jurusan],
        alamat: result[:alamat],
        kelas: result[:kelas]
      )

      if siswa.save
        status 201
        { "msg" => "Success adding data", "data" => siswa.values }.to_json
      else
        status 422
        { "msg" => "Failed adding data", "data" => siswa.values }.to_json
      end
    else
      status 422
      { "errors" => result.errors.to_h }.to_json
    end
  rescue JSON::ParserError
    status 400
    { "error" => "Invalid JSON" }.to_json
  rescue => e
    status 500
    { "error" => "Server error: #{e.message}" }.to_json
  end
end

delete "/siswaByNis" do
  begin
    nisValidate = NisValidator.new
    result = nisValidate.call(nis: params[:nis].to_i)
    if result.success?
      siswa = Siswa.where(nis: result[:nis])
      if siswa.empty?
        status 404
        { errors: "Data not found from database" }.to_json
      else
        status 200
        siswa.delete
        { msg: "Succes delete data", data: result }.to_json
      end
    else
      status 422
      { "errors" => result.errors.to_h }.to_json
    end
  rescue => e
    status 500
    { "error" => "Server error: #{e.message}" }.to_json
  end
end
delete "/siswaById" do
  begin
    if params[:id]
      siswa = Siswa.where(id: params[:id])
      if siswa.empty?
        status 404
        { errors: "Data not found from database" }.to_json
      else
        status 200
        siswa.delete
        { msg: "Succes delete data", data: siswa.to_h }.to_json
      end
    else
      status 422
      { "errors" => "id not found" }.to_json
    end
  rescue => e
    status 500
    { "error" => "Server error: #{e.message}" }.to_json
  end
end
