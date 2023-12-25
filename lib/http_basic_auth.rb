class HttpBasicAuth
  def initialize(app)
    @app = app
  end

  def call(env)
    auth = Rack::Auth::Basic::Request.new(env)

    if auth.provided? && auth.basic? && auth.credentials && auth.credentials == [ENV["ADMIN_LOGIN"], ENV["ADMIN_PASSWORD"]]
      @app.call(env)
    else
      [401, { "Content-Type" => "text/plain", "WWW-Authenticate" => 'Basic realm="Restricted Area"' }, ["Unauthorized"]]
    end
  end
end
