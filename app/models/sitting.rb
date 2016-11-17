class Sitting < Grom::Base
  def self.property_translator
    {
        id: 'id',
        sittingStartDate: 'start_date',
        sittingEndDate: 'end_date'
    }
  end
end