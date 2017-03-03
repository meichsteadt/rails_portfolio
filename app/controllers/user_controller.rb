require 'rest-client'
class UserController < ApplicationController
  def index
    redirect_to "https://github.com/login/oauth/authorize?&client_id=<%= ENV["CLIENT_ID"] %>"
  end

  def new
    code = params[:code]
    @user = User.new()
    access_token = @user.post(code)["access_token"]
    user = JSON.parse(RestClient.get('https://api.github.com/user',
                  {:params => {:access_token => access_token}}))
    if user["login"] === ENV["GITHUB_LOGIN"]
      session[:access_token] = access_token
      flash[:notice] = "You are now logged in"
      redirect_to landing_index_path
    else
      flash[:notice] = "You are not me"
      redirect_to '/'
    end
  end
end
