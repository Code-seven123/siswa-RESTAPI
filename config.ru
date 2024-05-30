require "sinatra"
require "./apps/middleware/all"

Dir["./apps/controller/*.rb"].each do |file|
  text = file.sub(/\.rb\z/, '')
  require text
end
public_path = File.expand_path("./public")
set :public_folder, public_path

run CreateController
run DeleteController
use AllMiddleware
