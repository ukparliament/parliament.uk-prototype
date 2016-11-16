class DummyPerson < Grom::Base
  has_many_through :dummy_parties, :dummy_party_memberships
  has_many :dummy_contact_points

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