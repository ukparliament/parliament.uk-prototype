require 'rails_helper'

describe Person do
  describe 'attributes of a Person' do
    let(:person) { Person.new({ "id" => '123', "name" => 'John Doe' }) }

    it 'has a name attribute' do
      expect(person.name).to eq 'John Doe'
    end

    it 'has an id attribute' do
      expect(person.id).to eq '123'
    end
  end
end