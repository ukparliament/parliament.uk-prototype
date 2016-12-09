require 'rails_helper'

describe VCardHelper do
  let(:extended_class) { Class.new { extend VCardHelper } }

  describe '#create_vcard' do
    it 'returns a v_card with just a postal code' do
      dummy_contact_point = OpenStruct.new(postal_code: 'BS13 9RN')
      vcard = extended_class.create_vcard(dummy_contact_point)
      expect(vcard.address.postalcode).to eq 'BS13 9RN'
    end

    it 'returns a v_card with just a street address' do
      dummy_contact_point = OpenStruct.new(street_address: '4 Privet Drive')
      vcard = extended_class.create_vcard(dummy_contact_point)
      expect(vcard.address.street).to eq '4 Privet Drive'
    end

    it 'returns a v_card with just a locality' do
      dummy_contact_point = OpenStruct.new(address_locality: 'Bristol')
      vcard = extended_class.create_vcard(dummy_contact_point)
      expect(vcard.address.locality).to eq 'Bristol'
    end

    it 'returns a v_card with just a fax number' do
      dummy_contact_point = OpenStruct.new(fax_number: '0992374982373')
      vcard = extended_class.create_vcard(dummy_contact_point)
      expect(vcard.telephone.to_s).to eq '0992374982373'
    end

    it 'returns a v_card with a telephone number and a fax number' do
      dummy_contact_point = OpenStruct.new(telephone: '9999999999999', fax_number: '0992374982373')
      vcard = extended_class.create_vcard(dummy_contact_point)
      expect(vcard.telephones[0].to_s).to eq '9999999999999'
      expect(vcard.telephones[1].to_s).to eq '0992374982373'
    end

    it 'returns a v_card with just an email address' do
      dummy_contact_point = OpenStruct.new(email: 'harry_potter@hogwarts.co.uk')
      vcard = extended_class.create_vcard(dummy_contact_point)
      expect(vcard.email.to_s).to eq 'harry_potter@hogwarts.co.uk'
    end

    it 'returns a v_card with a full address and an owner, a fax and a telephone number' do
      dummy_contact_point = OpenStruct.new(owner_name: 'Harry Potter', address_locality: 'Bristol', street_address: '4 Privet Drive', postal_code: 'BS13 9RN', telephone: '9999999999999', fax_number: '0992374982373', email: 'harry_potter@hogwarts.co.uk')
      vcard = extended_class.create_vcard(dummy_contact_point)
      expect(vcard.name.given).to eq 'Harry Potter'
      expect(vcard.address.postalcode).to eq 'BS13 9RN'
      expect(vcard.address.street).to eq '4 Privet Drive'
      expect(vcard.address.locality).to eq 'Bristol'
      expect(vcard.telephones[0].to_s).to eq '9999999999999'
      expect(vcard.telephones[1].to_s).to eq '0992374982373'
      expect(vcard.email.to_s).to eq 'harry_potter@hogwarts.co.uk'
    end

  end
end