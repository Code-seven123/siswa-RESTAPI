class AllMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "Processing request for #{env['REQUEST_PATH']}"
    status, headers, response = @app.call(env)
    if status == 404
      puts "Response status: #{status}"
      [404, { "content_type" => "application/json" }, { error: "endpoint not found" }.to_json]
    else
      puts "Response status: #{status}"
      [status, headers, response]
    end
  end
end
