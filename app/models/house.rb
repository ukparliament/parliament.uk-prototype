class House < Grom::Base
  has_many_through :members, via: :sittings
  has_many :parties

  def self.property_translator
    {
        id: 'id',
        type: 'type'
    }
  end
end

