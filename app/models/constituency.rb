class Constituency < Grom::Base

  has_many_through :members, via: :sittings

  def self.property_translator
    {
        id: 'id',
        constituencyName: 'name',
        constituencyStartDate: 'start_date',
        constituencyEndDate: 'end_date',
        constituencyLatitude: 'latitude',
        constituencyLongitude: 'longitude',
        constituencyExtent: 'polygon'
    }
  end
end