def draw_letters()
  letters = {
      "A" => 9,
      "B" => 2,
      "C" => 2,
      "D" => 4,
      "E" => 12,
      "F" => 2,
      "G" => 3,
      "H" => 2,
      "I" => 9,
      "J" => 1,
      "K" => 1,
      "L" => 4,
      "M" => 2,
      "N" => 6,
      "O" => 8,
      "P" => 2,
      "Q" => 1,
      "R" => 6,
      "S" => 4,
      "T" => 6,
      "U" => 4,
      "V" => 2,
      "W" => 2,
      "X" => 1,
      "Y" => 2,
      "Z" => 1
  }

  pool_of_letters = []
  letters.each do |letter, quantity|
    pool_of_letters.concat(Array.new(quantity, letter))
  end


  letters_in_hand = pool_of_letters.sample(10)
  return letters_in_hand
end

p letters_in_hand = draw_letters()


def uses_available_letters?(input, letters_in_hand)

  letters_in_hand_hash = Hash.new(0)

  letters_in_hand.each do |letter|
    letters_in_hand_hash[letter] += 1
  end

  input_array = []
  input_array = input.upcase.split(//)
  input_hash = Hash.new(0)

  input_array.each do |letter|
    count_of_letter = input_array.count(letter)
    input_hash[letter] = count_of_letter
  end



# Returns false if there is a letter in input that is not present in the letters_in_hand
  input_array.each do |letter|
    if !letters_in_hand_hash.has_key?(letter)
      return false
    end
  end


  input_hash.each do |letter, count|
    count_of_letter_in_input = input_hash[letter]
    count_of_letter_in_hand = letters_in_hand_hash[letter]

    if  count_of_letter_in_input > count_of_letter_in_hand
      return false
    end
  end

  return false if input.length == 0

  return true
end

p uses_available_letters?("hi",["A", "E", "O", "R", "G", "S", "E", "E", "J", "T"])

#Wave 3
# the cost of the word
def score_word(word)
  letters_cost = {
      "A" => 1,
      "E" => 1,
      "I" => 1,
      "O" => 1,
      "U" => 1,
      "L" => 1,
      "N" => 1,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "D" => 2,
      "G" => 2,
      "B" => 3,
      "C" => 3,
      "M" => 3,
      "P" => 3,
      "F" => 4,
      "H" => 4,
      "V" => 4,
      "W" => 4,
      "Y" => 4,
      "K" => 5,
      "J" => 8,
      "X" => 8,
      "Q" => 10,
      "Z" => 10,
      }


  letters = word.upcase.split(//) # NoMethodError: undefined method `upcase' for ["a"]:Array when it was word.split(//).upcase
  score = 0

  letters.each do |letter|
    score += letters_cost[letter]
  end

  # if letters.length <= 10 && letters.length >= 7 Can't be 10 AND 7
  if letters.length < 11 && letters.length > 6
    score += 8
  end
  return score
end

# Wave 4
# Find highest scoring word
def highest_score_from(words)

  word_score_hash = Hash.new(0)

  words.each do |word|
    score = score_word(word) # return a score
    word_score_hash[word] = score
  end

  sorted_word_score_array = word_score_hash.sort_by { |word, score| score }

  highest_score = sorted_word_score_array[-1][-1]

  sorted_word_score_hash = sorted_word_score_array.to_h

  tie_hash = {}
  sorted_word_score_hash.each do |word, score|
    if highest_score == score
      tie_hash[word] = score
    end
  end

  #tie_hash {word4: 4, word5: 4}
  winner = {}
  min_word = ''
  if tie_hash.length > 1
    tie_hash.each do |word, score|
      if word < min_word
        min_word = word
        winner = { min_word => score }
      end
    end
  end

  return winner
end

