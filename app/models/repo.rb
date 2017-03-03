require 'rest-client'
class Repo < ActiveRecord::Base
  def self.get_repos(access_token)
    JSON.parse(RestClient.get('https://api.github.com/user/repos',
                  {:params => {:access_token => access_token}}))
    rescue
      false
  end
end
