require "sinatra"
require "./apps/middleware/all"
require "./apps/controller/createController"
require "./apps/controller/DeleteController"

public_path = File.expand_path("./public")
set :public_folder, public_path

use AllMiddleware
run CreateController.new
run DeleteController.new
puts "Daftar Rute Aktif:"
puts CreateController.inspect
puts DeleteController.inspect
