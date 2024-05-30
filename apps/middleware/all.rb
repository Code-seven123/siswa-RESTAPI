class AllMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "Processing request for #{env['REQUEST_PATH']}"
    status, headers, response = @app.call(env)
    puts "Response status: #{status}"
    [status, headers, response]
  end
end
