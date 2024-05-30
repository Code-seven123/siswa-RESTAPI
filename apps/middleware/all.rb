class AllMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "Processing request for #{env['REQUEST_PATH']}"
    status, headers, response = @app.call(env)
    headers['Content-Type'] ||= 'application/json'
    puts "Response status: #{status}"
    [status, headers, response]
  end
end
