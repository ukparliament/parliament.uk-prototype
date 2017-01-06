class Sitting < Grom::Base
  has_associations :house, :constituency, :member
  has_one :person
  # has_one :house
  # has_one :constituency

  def self.property_translator
    {
        id: 'id',
        sittingStartDate: 'start_date',
        sittingEndDate: 'end_date'
    }
  end
end
