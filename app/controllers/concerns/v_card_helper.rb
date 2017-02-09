module VCardHelper
  def create_vcard(contact_point)
    Vcard::Vcard::Maker.make2 do |maker|
      maker.add_name do |name|
        unless contact_point.person.empty?
          name.given = contact_point.person.first.given_name
          name.family = contact_point.person.first.family_name
        end
        unless contact_point.postal_addresses.empty?
          address = contact_point.postal_addresses.first.full_address
          maker.add_addr do |addr|
            addr.street = address unless address == ''
          end
        end
      maker.add_email(contact_point.email) unless contact_point.email == ''
      maker.add_tel(contact_point.phone_number) unless contact_point.phone_number == ''
      maker.add_tel(contact_point.fax_number) { |f| f.location = 'fax' } unless contact_point.fax_number == ''
      end
    end
  end
end
