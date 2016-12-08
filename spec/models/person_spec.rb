require 'rails_helper'

describe Person do
  let(:person) { Person.new({ forename: 'Arya', surname: 'Stark', graph: RDF::Graph.new, id: '123', gender: 'female', dateOfBirth: '1982-09-01' }) }

  describe '#display_name' do
    it 'given a forename and surname it will construct a display_name' do
      expect(person.display_name).to eq 'Arya Stark'
    end
  end

  describe 'associations' do
    it 'should respond to sittings' do
      expect(person).to respond_to(:sittings)
    end

    it 'should respond to contact_points' do
      expect(person).to respond_to(:contact_points)
    end

    it 'should respond to constituencies' do
      expect(person).to respond_to(:constituencies)
    end

    it 'should respond to houses' do
      expect(person).to respond_to(:houses)
    end

    it 'should respond to parties' do
      expect(person).to respond_to(:parties)
    end
  end

  describe 'properties' do
      it 'should have a forename' do
        expect(person.forename).to eq 'Arya'
      end

      it 'should have a surname' do
        expect(person.surname).to eq 'Stark'
      end

      it 'should have a forename' do
        expect(person.id).to eq '123'
      end

      it 'should have a forename' do
        expect(person.gender).to eq 'female'
      end

      it 'should have a date of birth' do
        expect(person.date_of_birth).to eq '1982-09-01'
      end

      it 'should have a graph' do
        expect(person).to respond_to(:graph)
      end
  end
end