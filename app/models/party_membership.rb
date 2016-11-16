class PartyMembership < Grom::Base
  def self.property_translator
    {
        id: 'id',
        partyMembershipStartDate: 'start_date',
        partyMembershipEndDate: 'end_date'
    }
  end
end