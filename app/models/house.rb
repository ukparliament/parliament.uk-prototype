class House < Grom::Base
  def self.property_translator
    {
        id: 'id'
    }
  end
end

