require "sinatra/base"
require_relative "../validator"
require_relative "../models/siswa"
require "json"

class DeleteController < Sinatra::Base
  delete "/siswa/dn/:nis" do
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
          { msg: "Succes delete data" }.to_json
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
  delete "/siswa/d/:id" do |id|
    begin
      if id
        siswa = Siswa.where(id: id.to_i)
        if siswa.empty?
          status 404
          { errors: "Data not found from database" }.to_json
        else
          status 200
          siswa.delete
          { msg: "Succes delete data" }.to_json
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
end
