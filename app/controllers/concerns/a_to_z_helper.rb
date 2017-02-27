module AToZHelper
  def generate_letters(letter_array)
    letters = {}

    active_letters = letter_array.map(&:value)
    inactive_letters = ('A'..'Z').to_a - active_letters

    active_letters.each { |letter| letters[letter] = 'active' }
    inactive_letters.each { |letter| letters[letter] = 'inactive' }

    letters.sort_by { |key, value| I18n.transliterate(key) }.to_h
  end
end
