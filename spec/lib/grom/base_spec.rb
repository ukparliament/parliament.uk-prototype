require 'rails_helper'

describe Grom::Base do

  describe '#find' do
    it 'should return a single new object while setting its properties' do
      dummy = DummyPerson.find(PERSON_ONE_GRAPH)
      expect(dummy.forename).to eq 'Daenerys'
      expect(dummy.id).to eq '1'
      expect(dummy.surname).to eq 'Targaryen'
      expect(dummy.middle_name).to eq 'Khaleesi'
      expect(dummy.date_of_birth).to eq '1947-06-29'
    end
  end

  describe '#all' do
    it 'should return an array of objects while setting the properties of the first object' do
      dummies = DummyPerson.all(PEOPLE_GRAPH)
      arya_dummy = dummies.select{ |o| o.id == '2' }.first
      expect(arya_dummy.forename).to eq 'Arya'
      expect(arya_dummy.surname).to eq 'Stark'
      expect(arya_dummy.middle_name).to eq 'The Blind Girl'
      expect(arya_dummy.date_of_birth).to eq '1954-01-12'
    end
    it 'should return an array of objects while setting the properties of the second object' do
      dummies = DummyPerson.all(PEOPLE_GRAPH)
      daenerys_dummy = dummies.select{ |o| o.id == '1' }.first
      expect(daenerys_dummy.forename).to eq 'Daenerys'
      expect(daenerys_dummy.surname).to eq 'Targaryen'
      expect(daenerys_dummy.middle_name).to eq 'Khaleesi'
      expect(daenerys_dummy.date_of_birth).to eq '1947-06-29'
    end
  end

  xdescribe '#has_many' do
    it 'should create a has_many association for a given class' do
        dummy_person = DummyPerson.find(PERSON_ONE_GRAPH)
        expect(dummy_person).to respond_to(:parties)
        expect(dummy_person.parties[0].name).to eq 'Liberal Democrat'
    end
  end

  describe '#has_many_through' do
    it 'should create a has_many_through association for a given class and be able to call the through_class on the association' do
        dummy_person = DummyPerson.find(PERSON_ONE_GRAPH)
        expect(dummy_person.dummy_parties[0].name).to eq 'Targaryens'
        expect(dummy_person.dummy_parties[0].dummy_party_memberships[0].start_date).to eq '1953-01-12'
        expect(dummy_person.dummy_parties[0].dummy_party_memberships[0].end_date).to eq '1954-01-12'
    end
  end

end