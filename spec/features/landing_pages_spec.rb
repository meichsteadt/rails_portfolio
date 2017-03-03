require 'rails_helper'

describe 'landing page' do
  it 'shows the landing page' do
    visit '/'
    expect(page).to have_content "Matt Eichsteadt"
  end
end
