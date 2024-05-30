require "sinatra"
require 'sinatra/base'

require "./apps/middleware/all"

public_path = File.expand_path("./public")
set :public_folder, public_path

use AllMiddleware

ObjectSpace.each_object(Class).select { |controller| controller < Sinatra::Base }.each { |controller| run controller }

