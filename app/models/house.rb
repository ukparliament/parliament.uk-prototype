class House < Grom::Base
  has_many_through :members, via: :sittings

  def self.property_translator
    {
        id: 'id'
    }
  end
end

