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
  # evaluates boolean array: if all values are true, returns true. Otherwise returns false.
  return include_letter_array.all?(true)
end

# We want a method that returns the score of a given word as defined by the Adagrams game.

# Name this method score_word in adagrams.rb. This method should have the following properties:

# Has one parameter: word, which is a string of characters
# Returns an integer representing the number of points
# Each letter within word has a point value. The number of points of each letter is summed up to represent the total score of word
# Each letter's point value is described in the table below
# If the length of the word is 7, 8, 9, or 10, then the word gets an additional 8 points

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