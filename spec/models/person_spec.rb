require 'rails_helper'

describe Person do
  describe '#display_name' do
    let(:person) { Person.new({ forename: 'Arya', surname: 'Stark' }) }
    it 'given a forename and surname it will construct a display_name' do
      expect(person.display_name).to eq 'Arya Stark'
    end
  end
end