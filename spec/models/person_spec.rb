require 'rails_helper'

describe Person do
  let(:person) { Person.new({ forename: 'Arya', surname: 'Stark', id: '123', gender: 'female', dateOfBirth: '1982-09-01' }) }
  let(:partial_person) { Person.new({ surname: 'Stark', id: '124', gender: 'female', dateOfBirth: '1982-09-01' }) }

  describe '#display_name' do
    it 'given a forename and surname it will construct a display_name' do
      expect(person.display_name).to eq 'Arya Stark'
    end

    it 'given a surname it will construct a display_name' do
      expect(partial_person.display_name).to eq 'Stark'
    end
  end

  describe 'properties' do
      it 'can have a forename' do
        expect(person.forename).to eq 'Arya'
      end

      it 'can have a surname' do
        expect(person.surname).to eq 'Stark'
      end

      it 'can have a forename' do
        expect(person.id).to eq '123'
      end

      it 'can have a forename' do
        expect(person.gender).to eq 'female'
      end

      it 'can have a date of birth' do
        expect(person.date_of_birth).to eq '1982-09-01'
      end
  end
end
