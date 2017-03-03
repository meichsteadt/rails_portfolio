require 'rest-client'
class Repo < ActiveRecord::Base
  def self.get_repos
    RestClient.get('https://api.github.com/meichsteadt/repos')
  end
end
