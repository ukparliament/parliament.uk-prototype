require 'rails_helper'

RSpec.describe 'media', type: :routing do
  describe MediaController do
    context 'media' do
      include_examples  'index route', 'media'
    end

    context 'media' do
      # media#show
      include_examples 'nested routes with an id', 'media', '12345678', [], 'show'
    end
  end
end
