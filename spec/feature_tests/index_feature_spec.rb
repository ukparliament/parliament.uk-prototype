require 'rails_helper'

feature 'index page' do
  context 'when visiting the home page' do
    before(:each) do
      visit people_path
    end

    scenario 'should show a list of all people' do
      expect(page).to have_content('People')
      expect(page).to have_selector('li', count: 2)
    end

    scenario 'the first person in the list should have name Daenerys' do
      expect(page).to have_link('Daenerys')
    end
  end
end
