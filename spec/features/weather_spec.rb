require 'rails_helper'

feature 'Weather index' do
  before { visit '/' }

  scenario 'User visits index page' do
    expect(page).to have_content 'Weather in any city'
    expect(page).not_to have_content 'Weather in Yaroslavl'
  end

  context 'searching for weather' do
    scenario 'User searches with empty query' do
      click_button 'Find'
      expect(page).not_to have_content 'Weather in Yaroslavl'
    end

    scenario 'User searches city Yaroslavl in Russia' do
      allow_any_instance_of(Weather).to receive(:openweathermap).and_return(
        JSON.load(File.read('spec/fixtures/openweathermap1.json'))
      )

      select('Russian Federation', from: 'country')
      fill_in 'city', with: 'Yaroslavl'
      click_button 'Find'

      expect(page).to have_content 'Weather in Yaroslavl, RU'
      expect(page).to have_content '989.94'
    end

    scenario 'User inputs wrong city' do
      allow_any_instance_of(Weather).to receive(:openweathermap).and_return([])
      
      select('Russian Federation', from: 'country')
      fill_in 'city', with: 'Yaro33slavl'
      click_button 'Find'

      expect(page).to have_content 'No information for Yaro33slavl'
    end
  end
end
