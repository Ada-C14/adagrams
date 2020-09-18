#wave 1
def draw_letters
  letters_pool = []

  letter_quantity = {"A": 9, "B": 2, "C": 2, "D": 4, "E": 12, "F": 2, "G": 3, "H": 2, "I": 9, "J": 1, "K": 1, "L": 4, "M": 2, "N": 6, "O": 8, "P": 2, "Q": 1, "R": 6, "S": 4, "T": 2, "U": 4, "V": 2, "W": 2, "X": 1, "Y": 2, "Z": 1}

  letter_quantity.each do |letter, qty|
    qty.times do
      letters_pool << letter.to_s
    end
  end

  #p letters_pool
  drawn_letters = letters_pool.sample(10)
  return drawn_letters
end

##################################################
#Wave 2
def uses_available_letters?(input, letters_in_hand)
  valid_word = nil
  input_as_array = input.upcase.split("")
  hand = letters_in_hand.dup
  letters_boolean = []

  input_as_array.each do |letter|
    if hand.include?(letter)
      index = hand.index(letter)
      hand.delete_at(index)
      letters_boolean << true
    else
      letters_boolean << false
    end
  end

  if letters_boolean.include?(false)
    valid_word = false
  else
    valid_word = true
  end

  return valid_word
end
##################################################
#wave 3
def score_word(word)
  score = 0
  word_array = word.upcase.split("")

  word_array.each do |letter|
    case letter
      when "A", "E", "I", "O", "U", "L", "N", "R", "S","T"
        score += 1
      when "D", "G"
        score += 2
      when "B", "C", "M", "P"
        score += 3
      when "F", "H", "V","W", "Y"
        score += 4
      when "K"
        score += 5
      when "J", "X"
        score += 8
      when "Q", "Z"
        score += 10
    end
  end

  if word_array.length >= 7 && word_array.length <=10
    score += 8
  end

  return score
end
################################################
#wave 4
def highest_score_from(words)
  array_of_words = []

  words.each do |word|
    array_of_words <<  {
        word: word,
        score: score_word(word),
        length: word.length
    }
  end

  highest_scoring_word = array_of_words.max_by{ |word| word[:score].to_i}

  ties = []
  ties = array_of_words.select {|word| word[:score] == highest_scoring_word[:score]} #an array of hashes of the ties

  winner = []

  ties.each do |word_hash|
    if word_hash[:length] == 10
      winner << word_hash
    end
  end

  if winner.empty?
    winner << ties.min_by{ |word_hash| word_hash[:length].to_i }
  end

  winning_word = {}

  winning_word[:word] = winner[0][:word]
  winning_word[:score] = winner[0][:score]

  return winning_word
end

#############################################
#wave 2
# attempt with simpler version 3pm
# def uses_available_letters?(user_word, letters_in_hand)
#
#   user_word_array = user_word.split("")
#   hand = letters_in_hand.dup
#
#   valid_word = nil
#
#   user_word_array.each do |letter|
#     if hand.include?(letter)
#       valid_word = true
#       index = hand.index(letter) #returns the index # from hand for that letter
#       hand.delete_at(index) #deleted only at the one index so that it would not delete all instances of the letter
#
#     else
#       valid_word = false
#     end
#
#   end
#
#   return valid_word #returns true or false
# end