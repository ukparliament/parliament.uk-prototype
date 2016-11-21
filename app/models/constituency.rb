class Constituency < Grom::Base

  has_many_through :members, via: :sittings
  has_one :contact_point

  def self.property_translator
    {
        id: 'id',
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