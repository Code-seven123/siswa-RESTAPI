require './app'

run Rack::Builder.new {
  use AllMiddleware
  run Main
}
