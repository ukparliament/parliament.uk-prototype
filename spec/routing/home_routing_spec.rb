require 'rails_helper'

RSpec.describe 'home', type: :routing do
  describe 'HomeController' do
    it 'GET home#index' do
      expect(get: '/').to route_to(
        controller: 'home',
        action:     'index'
      )
    end

    it 'GET home#mps' do
      expect(get: '/mps').to route_to(
        controller: 'home',
        action:     'mps'
      )
    end

  end
end
