require 'grom'

class Person < Grom::Base
  extend Grom::GraphMapper

  has_many_through :constituencies, :sittings
  has_many_through :parties, :party_memberships
  has_many :contact_points

  def self.property_translator
    {
        id: 'id',
        forename: 'forename',
        surname: 'surname',
        middleName: 'middle_name',
        dateOfBirth: 'date_of_birth'
    }
  end

  def display_name
    display_name = ''
    display_name += self.forename + ' ' if self.forename
    display_name += self.surname if self.surname
  end
end