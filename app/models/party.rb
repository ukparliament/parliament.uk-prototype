class Party < Grom::Base

  has_associations :members, :party_memberships

  def self.property_translator
    {
        id: 'id',
        type: 'type',
        partyName: 'name'
    }
  end
end
