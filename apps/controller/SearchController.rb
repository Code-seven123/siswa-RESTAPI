require "sinatra/base"
require_relative "../validator"
require_relative "../models/siswa"
require "json"

class SearchController < Sinatra::Base
  get "/siswa/nama/:nama" do
    begin
      if params[:nama].empty?
        halt 400, { error: "parameter nama is required" }.to_json
      end
      siswa = Siswa.where(Sequel.lit("nama LIKE ?", "%#{params[:nama]}%")).all
      if siswa.empty?
        halt 404, { error: "Siswa data not found" }.to_json
      else
        status 202
        { search: "#{params[:nama]}", data: siswa.map(&:values) }.to_json
      end
    rescue => e
      status 400
      { error: "#{e}" }.to_json
    end
  end
  get "/siswa/kelas/:kelas" do
    begin
      if params[:kelas].empty?
        halt 400, { error: "parameter kelas is required" }.to_json
      end
        siswa = Siswa.where(Sequel.lit("kelas LIKE ?", "%#{params[:kelas]}%")).all
      if siswa.empty?
        halt 404, { error: "Siswa data not found" }.to_json
      else
        status 202
        { search: "#{params[:kelas]}", data: siswa.map(&:values) }.to_json
      end
    rescue => e
      status 400
      { error: "#{e}" }.to_json
    end
  end
  get "/siswa/id/:id" do
  begin
    if params[:id].empty?
      halt 400, { error: "parameter id is required" }.to_json
    end

    siswa = Siswa.where(Sequel.lit("id = ?", params[:id].to_i)).all
    if siswa.empty?
      halt 404, { error: "Siswa data not found" }.to_json
    else
      status 202
      { search: "#{params[:id]}", data: siswa.map(&:values) }.to_json
    end
  rescue => e
    status 400
    { error: "#{e}" }.to_json
  end
end
get "/siswa/nis/:nis" do
  begin
    if params[:nis].empty?
      halt 400, { error: "parameter nis is required" }.to_json
    end

    siswa = Siswa.where(Sequel.lit("nis = ?", params[:nis].to_i)).all
    if siswa.empty?
      halt 404, { error: "Siswa data not found" }.to_json
    else
      status 202
      { search: "#{params[:nis]}", data: siswa.map(&:values) }.to_json
    end
  rescue => e
    status 400
    { error: "#{e}" }.to_json
  end
end
get "/siswa/jurusan/:jurusan" do
  begin
    if params[:jurusan].empty?
      halt 400, { error: "parameter jurusan is required" }.to_json
    end

    siswa = Siswa.where(Sequel.lit("jurusan LIKE ?", "%#{params[:jurusan]}%")).all
    if siswa.empty?
      halt 404, { error: "Siswa data not found" }.to_json
    else
      status 202
      { search: "#{params[:jurusan]}", data: siswa.map(&:values) }.to_json
    end
  rescue => e
    status 400
    { error: "#{e}" }.to_json
  end
end
get "/siswa/alamat/:alamat" do
  begin
    if params[:alamat].empty?
      halt 400, { error: "parameter alamat is required" }.to_json
    end

    siswa = Siswa.where(Sequel.lit("alamat LIKE ?", "%#{params[:alamat]}%")).all
    if siswa.empty?
      halt 404, { error: "Siswa data not found" }.to_json
    else
      status 202
      { search: "#{params[:alamat]}", data: siswa.map(&:values) }.to_json
    end
  rescue => e
    status 400
    { error: "#{e}" }.to_json
  end
end

end
