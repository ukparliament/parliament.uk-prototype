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

  describe '#has_many' do
    it 'should create a has_many association for a given class' do
        dummy_person = DummyPerson.find(PERSON_ONE_GRAPH)
        expect(dummy_person).to respond_to(:dummy_contact_points)
        p dummy_person.dummy_contact_points
        expect(dummy_person.dummy_contact_points[0].street_address).to eq 'House of Commons'
    end
  end

end