module VCardHelper
  def create_vcard(contact_point)
    Vcard::Vcard::Maker.make2 do |maker|
      maker.add_name do |name|
        if defined?(contact_point.owner_name) && !contact_point.owner_name.nil?
          name.given = contact_point.owner_name
        else
          name.given = ''
        end
      end
      if defined?(contact_point.street_address) && !contact_point.street_address.nil?
        maker.add_addr do |adr|
          if defined?(contact_point.street_address)
            adr.street = contact_point.street_address
          end
          if defined?(contact_point.address_locality) && !contact_point.address_locality.nil?
            adr.locality = contact_point.address_locality
          end
          if defined?(contact_point.postal_code) && !contact_point.postal_code.nil?
            adr.postalcode = contact_point.postal_code
          end
        end
      end
      if defined?(contact_point.email) && !contact_point.email.nil?
        maker.add_email(contact_point.email)
      end
      if defined?(contact_point.telephone) && !contact_point.telephone.nil?
        maker.add_tel(contact_point.telephone)
      end
      if defined?(contact_point.fax_number) && !contact_point.fax_number.nil?
        maker.add_tel(contact_point.fax_number) { |f| f.location = 'fax' }
      end
    end
  end
end