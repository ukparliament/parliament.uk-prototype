require 'rails_helper' do
  RSpec.describe AToZHelper do
    let(:extended_class) { Class.new(extend AToZHelper) }

    describe '#generate_letters' do
      expected_hash = {
        "A" => "inactive",
        "B" => "inactive",
        "C" => "inactive",
        "D" => "inactive",
        "E" => "inactive",
        "F" => "inactive",
        "G" => "inactive",
        "H" => "inactive",
        "I" => "inactive",
        "J" => "inactive",
        "K" => "inactive",
        "L" => "inactive",
        "M" => "inactive",
        "N" => "inactive",
        "O" => "active",
        "Ö" => "active",
        "P" => "active",
        "Q" => "inactive",
        "R" => "inactive",
        "S" => "inactive",
        "T" => "inactive",
        "U" => "inactive",
        "V" => "inactive",
        "W" => "inactive",
        "X" => "inactive",
        "Y" => "active",
        "Z" => "active"
      }

      expect(extended_class.generate_letters(['O', 'Ö', 'P', 'Y', 'Z'])).to eq(expected_hash)
    end
  end
end
