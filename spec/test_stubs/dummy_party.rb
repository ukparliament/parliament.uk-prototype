class DummyParty < Grom::Base
  def self.property_translator
    {
        id: 'id',
        partyName: 'name',
    }
  end
end