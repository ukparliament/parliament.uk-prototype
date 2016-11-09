require 'rails_helper'

describe Grom::Base do

  describe '#find' do
    it 'should return a single new object while setting its properties' do
      dummy = Dummy.find(PERSON_ONE_GRAPH)
      expect(dummy.forename).to eq 'Daenerys'
      expect(dummy.id).to eq '1'
      expect(dummy.surname).to eq 'Targaryen'
      expect(dummy.middle_name).to eq 'Khaleesi'
      expect(dummy.date_of_birth).to eq '1947-06-29'
    end
  end

  describe '#all' do
    it 'should return an array of objects while setting the properties of the first object' do
      dummies = Dummy.all(PEOPLE_GRAPH)
      arya_dummy = dummies.select{ |o| o.id == '2' }.first
      expect(arya_dummy.forename).to eq 'Arya'
      expect(arya_dummy.surname).to eq 'Stark'
      expect(arya_dummy.middle_name).to eq 'The Blind Girl'
      expect(arya_dummy.date_of_birth).to eq '1954-01-12'
    end
    it 'should return an array of objects while setting the properties of the second object' do
      dummies = Dummy.all(PEOPLE_GRAPH)
      daenerys_dummy = dummies.select{ |o| o.id == '1' }.first
      expect(daenerys_dummy.forename).to eq 'Daenerys'
      expect(daenerys_dummy.surname).to eq 'Targaryen'
      expect(daenerys_dummy.middle_name).to eq 'Khaleesi'
      expect(daenerys_dummy.date_of_birth).to eq '1947-06-29'
    end
  end
end