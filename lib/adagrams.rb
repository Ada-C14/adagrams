def draw_letters
  letters_hash = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1,
                   K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6,
                   U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 }
  letters_array = []

  # create an array with all the letters matching their frequency
  letters_hash.each_pair do |letter, frequency|
    frequency.times do
      letters_array.push(letter.to_s)
    end
  end
  return letters_array.sample(10)
end

#Make a copy of letters_in_hand and delete as we cycle through input_array letters
def uses_available_letters?(input, letters_in_hand)
  input_array = input.upcase.chars
  letters_copy = letters_in_hand.dup
  if input_array.length <= letters_in_hand.length
    input_array.each do |letter|
      if letters_copy.include?(letter)
        letters_copy.delete_at(letters_copy.index(letter))
      else
        return false
      end
    end
    return true
  else
    return false
  end
end

def score_word(word)
  word_array = word.upcase.chars
  score = 0

  if word_array.length > 6
    score += 8
  end

  word_array.each do |letter|
    case letter
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
  return score
end

# create 3 different scenarios for highest_score
#  scenario 1: single high scoring word
def highest_score_from(words)
  best_words = []
  highest_score = 0
  winner = {}
  words.each do |word|
    if score_word(word) > highest_score
      best_words.clear
      best_words << word
      highest_score = score_word(word)
    elsif score_word(word) == highest_score
      best_words << word
    end
  end

  # scenario 2: first ten letter word wins in tie-break
  # scenario 3: first shortest word wins in tie-break
  if best_words.length > 1
    tie_breaker = []
    word_length = 10
    best_words.each do |word|
      if word.length == 10
        tie_breaker.clear
        tie_breaker << word
        break
      elsif word.length < word_length
        tie_breaker.clear
        tie_breaker << word
        word_length = word.length
      end
    end
    winning_word_array = tie_breaker
  else
    winning_word_array = best_words
  end

  #Assigning hash values
  winner[:word] = winning_word_array[0]
  winner[:score] = highest_score
  return winner
end



