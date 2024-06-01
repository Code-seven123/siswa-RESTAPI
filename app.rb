require "sinatra"
require "./apps/middleware/all"
Dir["./apps/controller/*.rb"].each do |file|
  text = file.sub(/\.rb\z/, '')
  require_relative text
end

class Main < Sinatra::Base
  use CreateController
  use DeleteController
  use SearchController
  use AllMiddleware

  run! if app_file == $0
end
