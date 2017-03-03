require 'rails_helper'

describe Repo do
  it 'should return a list of repos if authenticated', vcr: true do
    repos = Repo.get_repos(ENV["GITHUB_PERSONAL_TOKEN"])
    expect(repos).to be_an_instance_of(Array)
  end

  it 'should return false if given bad info' do
    repos = Repo.get_repos('1')
    expect(repos).to eq(false)
  end
end
