class ContactPoint < Grom::Base
  def self.property_translator
    {
        id: 'id',
        email: 'email',
        telephone: 'telephone',
        faxNumber: 'fax_number',
        streetAddress: 'street_address',
        addressLocality: 'address_locality',
        postalCode: 'postal_code',
        owner: 'owner_name'
    }
  end

  def full_address
    full_address = ''
    full_address += self.street_address + ', ' unless self.street_address.nil?
    full_address += self.address_locality + ', ' unless self.address_locality.nil?
    full_address += self.postal_code unless self.postal_code.nil?
  end
end
