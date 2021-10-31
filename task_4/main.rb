# frozen_string_literal: true

# --- Вывод после выполнения ---
# {:а=>1072, :у=>1091, :о=>1086, :ы=>1099, :и=>1080, :э=>1101, :я=>1103, :ю=>1102, :ё=>1105, :е=>1077}

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

vowel_letters = %w[а у о ы и э я ю ё е]

letters = Hash.new
vowel_letters.each do |letter|
  letters[letter.to_sym] = letter.ord
end

puts letters.to_s
