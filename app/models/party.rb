require 'grom'

class Party < Grom::Base
  extend Grom::GraphMapper

  has_many :members

  def self.property_translator
    {
        id: 'id',
        partyName: 'name',
    }
  end
end