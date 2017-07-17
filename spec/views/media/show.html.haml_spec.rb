require 'rails_helper'

RSpec.describe 'media/show', vcr: true do
  before do
    assign(:image, double(:image, graph_id: 'XXXX'))

    render
  end

  context 'id' do
    it 'will render the correct id' do
      expect(rendered).to match(/XXXX/)
    end
  end
end
