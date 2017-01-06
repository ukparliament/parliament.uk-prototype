require 'rails_helper'

describe PeopleHelper do
  let(:house) { House.new({ id: 'HouseOfCommons' }) }
  let(:party) { Party.new({ id: '2', partyName: 'Starks' }) }
  let(:constituency) { Constituency.new({ id: '3', constituencyName: 'Westminster' }) }
  let(:contact_point) { ContactPoint.new({ id: '4', email: 'test@example.com', telephone: '0800987654321', faxNumber: '09876554321', streetAddress: '16 Roman Road', addressLocality: 'London', postalCode: 'SW1A 3BB' }) }
  let(:sitting_one) { Sitting.new({ id: '100', sittingStartDate: '2010-02-01', sittingEndDate: '2015-02-01' }) }
  let(:sitting_two) { Sitting.new({ id: '101', sittingStartDate: '2005-02-01', sittingEndDate: '2010-02-01' }) }
  let(:party_membership_one) { PartyMembership.new({ id: '102', partyMembershipStartDate: '2010-02-01', partyMembershipEndDate: '2015-02-01' }) }
  let(:party_membership_two) { PartyMembership.new({ id: '103', partyMembershipStartDate: '2010-02-01', partyMembershipEndDate: '2015-02-01' }) }
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
    end

    it 'returns the link if the data is present' do
      expect(house_link(person.sittings)).to eq "<a href=\"/houses/HouseOfCommons\">HouseOfCommons</a>"
    end

    it 'returns a message if the data is not present' do
      expect(house_link(no_data_person.sittings)).to eq 'No Information'
    end
  end

  describe '#party_link' do
    before(:each) do
      party_membership_one.party = party
      person.party_memberships = [party_membership_one, party_membership_two]
    end

    it 'returns the link if the data is present' do
      expect(party_link(person.party_memberships)).to eq "<a href=\"/parties/2\">Starks</a>"
    end

    it 'returns a message if the data is not present' do
      expect(party_link(no_data_person.party_memberships)).to eq 'No Information'
    end
  end

  describe '#constituency_link' do
    before(:each) do
      sitting_one.constituency = constituency
      person.sittings = [sitting_one, sitting_two]
      no_data_person.sittings = [sitting_two]
    end

    it 'returns the link if the data is present' do
      expect(constituency_link(person.sittings)).to eq "<a href=\"/constituencies/3\">Westminster</a>"
    end

    it 'returns a message if the data is not present' do
      expect(party_link(no_data_person.sittings)).to eq 'No Information'
    end
  end

  describe '#is_mp?' do
    before(:each) do
      sitting_one.house = house
      person.sittings = [sitting_one, sitting_two]
    end

    it 'returns true if the person is an MP' do
      expect(is_mp?(person)).to be true
    end

    it 'returns false if the person is not an MP' do
      expect(is_mp?(no_data_person)).to be false
    end
  end

  describe '#parliamentary_email' do
    before(:each) do
      person.contact_points = [contact_point]
    end

    it 'returns true if the person is an MP' do
      expect(parliamentary_email(person.contact_points)).to eq 'test@example.com'
    end

    it 'returns false if the person is not an MP' do
      expect(parliamentary_email(no_data_person.contact_points)).to eq 'No Information'
    end
  end

  describe '#parliamentary_phone' do
    before(:each) do
      person.contact_points = [contact_point]
    end

    it 'returns true if the person is an MP' do
      expect(parliamentary_phone(person.contact_points)).to eq '0800987654321'
    end

    it 'returns false if the person is not an MP' do
      expect(parliamentary_phone(no_data_person.contact_points)).to eq 'No Information'
    end
  end

  describe '#parliamentary_address' do
    before(:each) do
      person.contact_points = [contact_point]
    end

    it 'returns true if the person is an MP' do
      expect(parliamentary_address(person.contact_points)).to eq '16 Roman Road, London, SW1A 3BB'
    end

    it 'returns false if the person is not an MP' do
      expect(parliamentary_address(no_data_person.contact_points)).to eq 'No Information'
    end
  end
end
