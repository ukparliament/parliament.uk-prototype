class DummyPerson < Grom::Base
  has_many_through :dummy_parties, :dummy_party_memberships

  def self.property_translator
    {
        id: 'id',
        forename: 'forename',
        surname: 'surname',
        middleName: 'middle_name',
        dateOfBirth: 'date_of_birth'
    }
  end
end