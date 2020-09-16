# Our first job is to build a hand of 10 letters for the user. To do so, add a method called draw_letters in adagrams.rb. This method should have the following properties:

# No parameters
# Each string should contain exactly one letter
# These represent the hand of letters that the player has drawn
# The letters should be randomly drawn from a pool of letters
# This letter pool should reflect the distribution of letters as described in the table below
# There are only 2 available C letters, so draw_letters cannot ever return more than 2 Cs
# Since there are 12 Es but only 1 Z, it should be 12 times as likely for the user to draw an E as a Z
# Invoking this method should not change the pool of letters
# Imagine that the user returns their hand to the pool before drawing new letters

LETTERS = {
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

# WAVE 1
def draw_letters()
  all_letters = []

  # Creates an array of letters that matches the frequency listed in LETTERS
  LETTERS.each do |letter, frequency|
    frequency.times do
      all_letters << letter.to_s
    end
  end

  strings = all_letters.shuffle.first(10)
  return strings
end


# Wave 2
# Noor Pseaducode
# create a method uses_available_letters?(input, letter_in_hand)
# input = the first parameter, describes some input word, and is a string CHECK IF IT's A STRING
# letters_in_hand, the second parameter, describes an array of drawn letters in a hand. You can expect this to be an array of ten strings, with each string representing a letter
# Returns either true or false
# Returns true if every letter in the input word is available (in the right quantities) in the letters_in_hand
# Returns false if not; if there is a letter in input that is not present in the letters_in_hand or has too much of compared to the letters_in_hand

# Anna Pseudocode
# def uses_available_letters?(input, letters_in_hand)
# set a gate var (valid) to true <-- this means we start off assuming the word is valid
# separate the input string to an array of strings (each char has a slot in the array)
# 1) first check that all the letters in the word are in the hand - use set theory (temp - letters_in_hand).size == 0
# 2) if you pass the first check, for each letter in temp, if the count is > count in letters_in_hand --> valid = false
# 3) otherwise if you don't pass #1, valid = false
# return valid (which will be true or false based on the tests above)

def uses_available_letters?(input, letters_in_hand)
	input = input.chars

	if (input - letters_in_hand).size > 0
		return false
	else
		input.each do |letter|
			if input.count(letter) > letters_in_hand.count(letter)
				return false
			end
		end
		return true
	end
end

# wave 3