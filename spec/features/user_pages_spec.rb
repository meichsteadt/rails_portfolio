require 'rails_helper'

describe 'User pages' do
  it 'Goes through Oauth2 process' do
    visit "https://github.com/login/oauth/authorize?&client_id=#{ENV["CLIENT_ID"]}"
    fill_in 'login', :with => ENV["GITHUB_LOGIN"]
    fill_in 'password', :with => ENV["GITHUB_PASSWORD"]
    click_on 'Sign In'
    expect(page).to have_content "You are now logged in"
  end
end
