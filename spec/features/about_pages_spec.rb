require 'rails_helper'

describe 'about page' do
  it 'will display the about page' do
    visit about_index_path
    expect(page).to have_content "Matticulous"
  end
end
