require 'rails_helper'

feature 'Weather index' do
  scenario 'User visits index page' do
    visit '/'
    expect(page).to have_content 'Find weather information'
  end
end
