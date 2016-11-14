require 'grom'

class Sitting < Grom::Base
  extend Grom::GraphMapper

  # belongs_to :member

  def self.property_translator
    {
        id: 'id',
        startDate: 'start_date',
        endDate: 'end_date'
    }
  end
end