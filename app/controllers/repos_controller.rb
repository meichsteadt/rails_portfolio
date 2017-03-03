class ReposController < ApplicationController
  before_action :authenticate, except: [:index]
  def index
    @repos = Repo.all
  end

  def new
    @repos = Repo.get_repos(session[:access_token])
  end

  def create
    repos = params[:repos]
    Repo.all.each {|repo| repo.destroy}
    repos.each do |repo|
      r = eval(repo)
      Repo.create(name: r[:name], url: r[:url])
    end
    redirect_to repos_path
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
