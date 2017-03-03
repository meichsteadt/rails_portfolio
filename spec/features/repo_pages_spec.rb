require 'rails_helper'
describe 'Repo pages' do
  it 'should list all repos' do
    repo = FactoryGirl.create(:repo)
    visit repos_path
    expect(page).to have_content(repo[:name])
  end
end
