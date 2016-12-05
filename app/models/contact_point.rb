class ContactPoint < Grom::Base
  def self.property_translator
    {
        id: 'id',
        email: 'email',
        telephone: 'telephone',
        faxNumber: 'fax_number',
        streetAddress: 'street_address',
        addressLocality: 'address_locality',
        postalCode: 'postal_code'
    }
  end

  def full_address
    full_address = ''
    full_address += self.street_address + ' ' if self.street_address
    full_address += self.address_locality + ', ' if self.address_locality
    full_address += self.postal_code + ', ' if self.postal_code
  end
end