class Constituency < Grom::Base

  has_associations :members, :sittings, :contact_point

  # has_many_through :members, via: :sittings
  has_one :contact_point

  def self.property_translator
    {
        id: 'id',
        type: 'type',
        constituencyName: 'name',
        constituencyStartDate: 'start_date',
        constituencyEndDate: 'end_date',
        constituencyLatitude: 'latitude',
        constituencyLongitude: 'longitude',
        constituencyExtent: 'polygon',
        constituencyOnsCode: 'ons_code'
    }
  end
end
