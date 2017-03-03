class ReposController < ApplicationController
  before_action :authenticate, except: [:index]
  def index

  end

  def new
    @repo = Repo.new()
  end

  def create
    @repo = Repo.new(repo_params)
    if @repo.save
      flash[:notice] = "The Repo has been saved"
      redirect_to repos_path
    else
      render 'new'
    end
  end

private
  def repo_params
    params.require(:repo).permit(:url, :name, :image)
  end

  def authenticate
    begin
      RestClient.get('https://api.github.com/user',
                     {:params => {:access_token => session[:access_token]},
                      :accept => :json})
    rescue
      session[:access_token] = nil
      redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV["CLIENT_ID"]}"
    end
  end
end
