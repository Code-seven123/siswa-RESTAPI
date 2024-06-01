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
      siswa = Siswa.where(id: params[:id].to_i).first
      body = request.body.read
      if body.empty?
        halt 404, { error: "body is empty" }.to_json
      end
      if siswa
        siswa.update(JSON.parse(body))
        newSiswa = Siswa.where(id: params[:id].to_i).first
        status 200
        { newData: newSiswa.values }.to_json
      else
        halt 404, { error: "Data not found in database" }.to_json
      end
    rescue => e
      status 200
      { error: "#{e}" }.to_json
    end
  end
end
