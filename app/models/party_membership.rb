class PartyMembership < Grom::Base
  has_associations :party

  def self.property_translator
    {
        id: 'id',
        partyMembershipStartDate: 'start_date',
        partyMembershipEndDate: 'end_date'
    }
  end
end
