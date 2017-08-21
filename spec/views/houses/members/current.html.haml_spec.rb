require 'rails_helper'

RSpec.describe 'houses/members/current', vcr: true do
  before do
    allow(FlagHelper).to receive(:dissolution?).and_return(true)
    assign(:house, double(:house, name: 'House of Commons', graph_id: 'Kz7ncmrt'))
    assign(:people, [])
    assign(:current_person_type, 'MPs')
    assign(:other_person_type, 'Lords')
    assign(:other_house_id, 'MvLURLV5')
    assign(:house_id, 'Kz7ncmrt')
    assign(:party_id, '891w1b1k')
    assign(:letters, 'A')
    controller.params = { letter: 'a' }

    render
  end

  context 'header' do
    it 'will render the current person type' do
      expect(rendered).to match(/Current MPs/)
    end
  end

  context 'partials' do
    it 'will render letter navigation' do
      expect(response).to render_template(partial: 'pugin/components/_navigation-letter')
    end

    it 'will render pugin/elements/_list' do
      expect(response).to render_template('pugin/elements/_list')
    end

    it 'will render dissolution message' do
      expect(response).to render_template(partial: 'shared/_dissolution_message')
    end
  end
end
