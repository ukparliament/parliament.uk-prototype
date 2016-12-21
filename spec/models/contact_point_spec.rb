require 'rails_helper'

describe ContactPoint do
  let(:contact_point) { ContactPoint.new({ id: '123', email: 'test@example.com', telephone: '0800987654321', faxNumber: '09876554321', streetAddress: '16 Roman Road', addressLocality: 'London', postalCode: 'SW1A 3BB' }) }
  let(:partial_contact_point) { ContactPoint.new({ id: '124', streetAddress: '16 Roman Road', postalCode: 'SW1A 3BB' }) }

  describe '#full_address' do
    it 'given lines of an address, it will construct a whole address' do
      expect(contact_point.full_address).to eq '16 Roman Road, London, SW1A 3BB'
    end

    it 'given partial lines of an address, it will construct an address' do
      expect(partial_contact_point.full_address).to eq '16 Roman Road, SW1A 3BB'
    end
  end

  describe 'properties' do
    it 'can have an email' do
      expect(contact_point.email).to eq 'test@example.com'
    end

    it 'can have an id' do
      expect(contact_point.id).to eq '123'
    end

    it 'can have an email' do
      expect(contact_point.telephone).to eq '0800987654321'
    end

    it 'can have a fax number' do
      expect(contact_point.fax_number).to eq '09876554321'
    end

    it 'can have a street address' do
      expect(contact_point.street_address).to eq '16 Roman Road'
    end

    it 'can have an address locality' do
      expect(contact_point.address_locality).to eq 'London'
    end

    it 'can have a postal code' do
      expect(contact_point.postal_code).to eq 'SW1A 3BB'
    end
  end
end
