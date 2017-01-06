require 'rails_helper'

describe PeopleHelper do
  let(:house) { House.new({ id: '1' }) }
  let(:sitting_one) { Sitting.new({ id: '100', start_date: '2010-02-01', end_date: '2015-02-01' })}
  let(:sitting_two) { Sitting.new({ id: '101', start_date: '2005-02-01', end_date: '2010-02-01' })}
  let(:person) { Person.new({ forename: 'Arya', surname: 'Stark', id: '123', gender: 'female', dateOfBirth: '1982-09-01' }) }
  let(:no_data_person) { Person.new({id: '123', gender: 'female', dateOfBirth: '1982-09-01' }) }

  describe '#person_display_name' do
    it 'returns the name if the data is present' do
      expect(person_display_name(person)).to eq 'Arya Stark'
    end

    it 'returns a message if the data is not present' do
      expect(person_display_name(no_data_person)).to eq 'No Information'
    end
  end

  describe '#house_link' do
    before(:each) do
      sitting_one.house = house
      person.sittings = [sitting_one, sitting_two]
      no_data_person.sittings = [sitting_two]
    end

    it 'returns the link if the data is present' do
      expect(house_link(person.sittings.first.house)).to eq "<a href=\"/houses/1\">1</a>"
    end

    it 'returns a message if the data is not present' do
      expect(house_link(no_data_person.sittings.first.house)).to eq 'No Information'
    end
  end
end
