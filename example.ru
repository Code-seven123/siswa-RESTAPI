require "sinatra"
require "./apps/middleware/all"
require "./apps/controller/createController"
require "./apps/controller/DeleteController"

public_path = File.expand_path("./public")
set :public_folder, public_path

use AllMiddleware
run CreateController
run DeleteController
puts "Daftar Rute Aktif:"
puts CreateController.routes.inspect
puts DeleteController.routes.inspect
