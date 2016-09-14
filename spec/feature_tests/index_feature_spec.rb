require 'rails_helper'

feature 'index page' do
  context 'when visiting the home page' do
    before(:each) do
      visit root_path
    end

    xscenario 'should show list of all people' do
    end
  end
end