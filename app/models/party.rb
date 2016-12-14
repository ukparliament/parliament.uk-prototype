class Party < Grom::Base

  has_many_through :members, via: :party_memberships

  def self.property_translator
    {
        id: 'id',
        type: 'type',
        partyName: 'name'
    }
  end
end
