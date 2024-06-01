require "sinatra/base"
require_relative "../validator"
require_relative "../models/siswa"
require "json"

class SearchController < Sinatra::Base
  post "/siswa/update/:id" do
    begin
      if params[:id].empty?
        halt 404, { error: "parameter id not found" }.to_json
      end
      validator = SiswaOptValidator.new
      siswa = Siswa.where(id: params[:id].to_i).first
      body = request.body.read
      if body.empty?
        halt 404, { error: "body is empty" }.to_json
      end
      if siswa
        result = validator.call(JSON.parse(body))

        if result.success?
          siswa.update(result.to_h)
          newSiswa = Siswa.where(id: params[:id].to_i).first
          status 200
          { newData: newSiswa.values }.to_json
        else 
          status 422
          { "errors" => result.errors.to_h }.to_json
        end
      else
        halt 404, { error: "Data not found in database" }.to_json
      end
    rescue => e
      status 200
      { error: "#{e}" }.to_json
    end
  end
end
