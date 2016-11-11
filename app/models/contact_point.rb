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
end