class Party < Grom::Base

  has_many :members

  def self.property_translator
    {
        id: 'id',
        partyName: 'name',
    }
  end
end