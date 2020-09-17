require 'csv'

def draw_letters()
  hand = []

  letter_dist = {
      "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3,
      "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2,
      "N" => 6, "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6,
      "U" => 4, "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1
  }

  letter_pool = []

  letter_dist.each do |letter, times|
    letter_pool << Array.new(times) { letter }
  end

  letter_pool = letter_pool.flatten

  until hand.length == 10 do
    index = rand(letter_pool.length)

    hand << letter_pool[index]
    letter_pool.delete_at(index)
  end
  return hand
end

def uses_available_letters?(input, letters_in_hand)
  copy_lih = letters_in_hand.dup
  input.each_char do |letter|
    if copy_lih.include?(letter)
      copy_lih.delete_at(copy_lih.find_index(letter))
    else
      return false
    end
  end
  return true
end

def score_word(word)
  score_chart = {
      "A" => 1, "B" => 3, "C" => 3, "D" => 2, "E" => 1, "F" => 4, "G" => 2,
      "H" => 4, "I" => 1, "J" => 8, "K" => 5, "L" => 1, "M" => 3, "N" => 1,
      "O" => 1, "P" => 3, "Q" => 10, "R" => 1, "S" => 1, "T" => 1, "U" => 1,
      "V" => 4, "W" => 4, "X" => 8, "Y" => 4, "Z" => 10
  }

  score = 0

  word.upcase.each_char do |letter|
    score += score_chart[letter]
  end

  score += 8 if word.length >= 7

  return score
end

def highest_score_from(words)
  max_score = 0
  highest_word = ""

  words.each do |word|
    if score_word(word) > max_score
      max_score = score_word(word)
      highest_word = word
    elsif score_word(word) == max_score && word.length == highest_word.length
      next
    elsif score_word(word) == max_score && word.length == 10
      max_score = score_word(word)
      highest_word = word
    elsif score_word(word) == max_score && word.length < highest_word.length && highest_word.length != 10
      max_score = score_word(word)
      highest_word = word
    end
  end
  score_hash = { word: highest_word, score: max_score}
  return score_hash
end

def is_in_english_dict?(input)
  dict = CSV.read('assets/dictionary-english.csv')
  dict.include?([input.downcase]) ? true : false
end