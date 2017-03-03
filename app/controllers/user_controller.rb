class UserController < ApplicationController
  def new
    code = params[:code]
    @user = User.new()
    access_token = @user.post(code)["access_token"]
    session[:access_token] = access_token
    flash[:notice] = "You are now logged in"
    redirect_to landing_index_path
  end
end
