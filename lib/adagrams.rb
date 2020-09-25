def draw_letters
  letter_quantities = {
      A: 9,
      B: 2,
      C: 2,
      D: 4,
      E: 12,
      F: 2,
      G: 3,
      H: 2,
      I: 9,
      J: 1,
      K: 1,
      L: 4,
      M: 2,
      N: 6,
      O: 8,
      P: 2,
      Q: 1,
      R: 6,
      S: 4,
      T: 6,
      U: 4,
      V: 2,
      W: 2,
      X: 1,
      Y: 2,
      Z: 1
  }
  
  # places the appropriate number of each letter in an array
  letters_array = []
  letter_quantities.each do |key, value|
    value.times do
      letters_array << key.to_s
    end
  end

  return letters_array.shuffle.first(10)
end

def uses_available_letters?(input, letters_in_hand)

  # array of booleans to store results of each iteration through the input string
  include_letter_array = []

  # duplicate of the 10 drawn letters, in order to not alter the original array
  cloned_letter_in_hand = letters_in_hand.clone

  input.each_char do | letter |
    if cloned_letter_in_hand.include?(letter)
      # deletes letter at index (not all instances of the letter)
      cloned_letter_in_hand.slice!(cloned_letter_in_hand.index(letter))
      include_letter_array << true
    else
      include_letter_array << false
    end
  end
  # evaluates boolean array: if all values are true, returns true. Otherwise returns false
  return include_letter_array.all?(true)
end


def score_word(word)
  sum = 0

  word.upcase.each_char do |char|

    case char
    # splatting (*) an array turns each array item into a parameter that’s passed to the method
    when *%w[A E I O U L N R S T]
      sum += 1
    when *%w[D G]
      sum += 2
    when *%w[B C M P]
      sum += 3
    when *%w[F H V W Y]
      sum += 4
    when *%w[K]
      sum += 5
    when *%w[J X]
      sum += 8
    when *%w[Q Z]
      sum += 10
    end
  end

  if word.length > 6 && word.length < 11
    sum += 8
  end

  return sum
end

# tie breaker method
def tie_breaker(winners_array)

  # check for 10 letter words, return whichever appears first
  if winners_array.any? { |word_hash| word_hash[:word].length == 10}
    return winners_array.find { |word_hash| word_hash[:word].length == 10 }
  else 
    # check for the word with fewest letters, return whichever appears first
    return winners_array.min_by { |word_hash| word_hash[:word].length }
  end
end

def highest_score_from(words)

  array_of_words = []

  words.each do |word|
    word_hash = {}
    word_hash[:word] = word
    word_hash[:score] = score_word(word)
    array_of_words << word_hash
  end

  # finds the highest score
  highest_score_hash = array_of_words.max_by { |word_hash| word_hash[:score] }
  highest_score = highest_score_hash[:score]

  # checks if there are multiple words with the same highest score and stores it in an array
  winners_array = array_of_words.select { |word_hash| word_hash[:score] == highest_score }

  # invokes tie breaker method if the winners_array has more than one element
  if winners_array.length > 1
    return tie_breaker(winners_array)
  else
  # if no ties, returns the hash for the highest scoring word
    return winners_array[0]
  end
end




