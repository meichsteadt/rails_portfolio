require 'rest-client'
class UserController < ApplicationController
  def new
    code = params[:code]
    @user = User.new()
    access_token = @user.post(code)["access_token"]
    user = JSON.parse(RestClient.get('https://api.github.com/user',
                  {:params => {:access_token => access_token}}))
    if user["login"] === "meichsteadt"
      session[:access_token] = access_token
      flash[:notice] = "You are now logged in"
      redirect_to landing_index_path
    else
      flash[:notice] = "You are not me"
      redirect_to '/'
    end
  end
end
