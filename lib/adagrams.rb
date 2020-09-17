# - No parameters
# - Returns an array of ten strings
# - Each string should contain exactly one letter
# - These represent the hand of letters that the player has drawn
# - The letters should be randomly drawn from a pool of letters
# - This letter pool should reflect the distribution of letters as described in the table below
# - There are only 2 available `C` letters, so `draw_letters` cannot ever return more than 2 `C`s
# - Since there are 12 `E`s but only 1 `Z`, it should be 12 times as likely for the user to draw an `E` as a `Z`
# - Invoking this method should **not** change the pool of letters
# - Imagine that the user returns their hand to the pool before drawing new letters

def draw_letters
  hand = Array.new(10)

  letter_pool = [
      {letter: "A", count: 9},
      {letter: "B", count: 2},
      {letter: "C", count: 2},
      {letter: "D", count: 4},
      {letter: "E", count: 12},
      {letter: "F", count: 2},
      {letter: "G", count: 3},
      {letter: "H", count: 2},
      {letter: "I", count: 9},
      {letter: "J", count: 1},
      {letter: "K", count: 1},
      {letter: "L", count: 4},
      {letter: "M", count: 2},
      {letter: "N", count: 6},
      {letter: "O", count: 8},
      {letter: "P", count: 2},
      {letter: "Q", count: 1},
      {letter: "R", count: 6},
      {letter: "S", count: 4},
      {letter: "T", count: 6},
      {letter: "U", count: 4},
      {letter: "V", count: 2},
      {letter: "W", count: 2},
      {letter: "X", count: 1},
      {letter: "Y", count: 2},
      {letter: "Z", count: 1}
  ]

  hand.each_index do |i|
    letter_index = rand(0...letter_pool.length)

    while letter_pool[letter_index][:count] == 0
      letter_index = rand(0...letter_pool.length)
    end

    hand[i] = letter_pool[letter_index][:letter]
    letter_pool[letter_index][:count] -= 1
  end

  return hand
end

# To do so, add a method called `uses_available_letters?` in `adagrams.rb`. This method should have the following properties:
#
#- Has two parameters:
#   - `input`, the first parameter, describes some input word, and is a string
# - `letters_in_hand`, the second parameter, describes an array of drawn letters in a hand. You can expect this to be an array of ten strings, with each string representing a letter
# - Returns either `true` or `false`
# - Returns `true` if every letter in the `input` word is available (in the right quantities) in the `letters_in_hand`
# - Returns `false` if not; if there is a letter in `input` that is not present in the `letters_in_hand` or has too much of compared to the `letters_in_hand`
#

def uses_available_letters?(input, letters_in_hand)

  input_array = input.upcase.split("").sort
  sorted_hand = letters_in_hand.sort[0...input_array.length]

  return input_array == sorted_hand

end


# Name this method `score_word` in `adagrams.rb`. This method should have the following properties:
# - Has one parameter: `word`, which is a string of characters
# - Returns an integer representing the number of points
# - Each letter within `word` has a point value. The number of points of each letter is summed up to represent the total score of `word`
# - Each letter's point value is described in the table below
# - If the length of the word is 7, 8, 9, or 10, then the word gets an additional 8 points

#### Score chart

# |Letter                        | Value|
# |:----------------------------:|:----:|
# |A, E, I, O, U, L, N, R, S, T  |   1  |
# |D, G                          |   2  |
# |B, C, M, P                    |   3  |
# |F, H, V, W, Y                 |   4  |
# |K                             |   5  |
# |J, X                          |   8  |
# |Q, Z                          |   10 |

def score_word(word)
  points = 0

  word.upcase.each_char do |letter|
    case letter
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'
      points += 1
    when 'D', 'G'
      points += 2
    when 'B', 'C', 'M', 'P'
      points += 3
    when 'F', 'H', 'V', 'W', 'Y'
      points += 4
    when 'K'
      points += 5
    when 'J', 'X'
      points += 8
    when 'Q', 'Z'
      points += 10
    end
  end

  points += 8 if word.length > 6 && word.length <= 10

  return points
end
