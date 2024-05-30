require "sinatra/base"
require_relative "../validator"
require_relative "../models/siswa"
require "json"

class CreateController < Sinatra::Base
  get "/" do
    content_type :json
    { msg: "running" }.to_json
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
end
