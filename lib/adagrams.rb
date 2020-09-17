require 'csv'

def draw_letters
  letter_pool = %W( #{ "A" * 9 + "B" * 2 + "C" * 2 + "D" * 4 + "E" * 12 + "F" * 2 + "G" * 3 + "H" * 2 + "I" * 9 + "J" * 1 + "K" * 1 + "L" * 4 + "M" * 2 + "N" * 6 + "O" * 8 + "P" * 2 + "Q" * 1 + "R" * 6 + "S" * 4 + "T" * 6 + "U" * 4 + "V" * 2 + "W" * 2 + "X" * 1 + "Y" * 2 + "Z" * 1} ).join.split("")
  random_letter = letter_pool.shuffle.take(10)
  return random_letter
end

def uses_available_letters?(input, letters_in_hand)
  letters_in_hand_copy = letters_in_hand.clone
  input.upcase.each_char do |letter|
    if letters_in_hand_copy.include?(letter)
      letters_in_hand_copy.delete_at(letters_in_hand_copy.index(letter))
    else
      return false
    end
  end
  return true
end

def score_word(word)
  score = 0
  word.upcase.each_char do |character|
    case character
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      score += 1
    when "D", "G"
      score += 2
    when "B", "C", "M", "P"
      score += 3
    when "F", "H", "V", "W", "Y"
      score += 4
    when "K"
      score += 5
    when "J", "X"
      score += 8
    when "Q", "Z"
      score += 10
    end
  end

  if word.length >= 7
    score += 8
  end

  return score
end

def highest_score_from(words)
  winner = {
      word: "",
      score: 0
  }

  high_score = words.max_by { |word| score_word(word) }
  high_words = words.select { |word| score_word(word) == score_word(high_score) }

  if high_words.length == 1
    winner[:word] = high_words[0]
    winner[:score] = score_word(high_words[0])
  elsif high_words.any? { |word| word.length == 10 }
    ten_letter_words = high_words.select { |word| word if word.length == 10 }
    winner[:word] = ten_letter_words[0]
    winner[:score] = score_word(ten_letter_words[0])
  else
    shortest_word_length = (high_words.min_by { |word| word.length }).length
    short_words_array = high_words.select { |word| word.length == shortest_word_length }
    winner[:word] = short_words_array[0]
    winner[:score] = score_word(short_words_array[0])
  end

  return winner
end

def is_in_english_dict?(input)
  dictionary = CSV.read('../adagrams/assets/dictionary-english.csv').flatten
  return dictionary.include?(input.downcase)
end