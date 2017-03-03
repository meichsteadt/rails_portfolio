require 'rest-client'

class User
  def post(code)
    result = RestClient.post("https://github.com/login/oauth/access_token", {client_id: ENV["CLIENT_ID"], client_secret: ENV["CLIENT_SECRET"], code: code}, :accept => :json)
    JSON.parse(result)
  end
end
