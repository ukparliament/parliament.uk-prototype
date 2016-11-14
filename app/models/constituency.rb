require 'grom'

class Constituency < Grom::Base
  extend Grom::GraphMapper

  has_many_through :members

  def self.property_translator
    {
        id: 'id',
        constituencyName: 'name',
        constituencyStartDate: 'start_date',
        constituencyEndDate: 'end_date',
        constituencyLatitude: 'latitude',
        constituencyLongitude: 'longitude'
    }
  end
end