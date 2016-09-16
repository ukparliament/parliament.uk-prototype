require 'rails_helper'

describe Person do
  before(:each) do
    attributes = { id: '123', name: 'John Doe' }
    person = Person.new(attributes)
  end
  describe 'attributes of a Person' do
    it 'has a name attribute' do
      expect(person.name).to eq 'John Doe'
    end
  end
end