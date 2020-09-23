# frozen_string_literal: true

a = Array.new(9) { 'A' }
b = Array.new(2) { 'B' }
c = Array.new(2) { 'C' }
d = Array.new(4) { 'D' }
e = Array.new(12) { 'E' }
f = Array.new(2) { 'F' }
g = Array.new(3) { 'G' }
h = Array.new(2) { 'H' }
i = Array.new(9) { 'I' }
j = Array.new(1) { 'J' }
k = Array.new(1) { 'K' }
l = Array.new(4) { 'L' }
m = Array.new(2) { 'M' }
n = Array.new(6) { 'N' }
o = Array.new(8) { 'O' }
p = Array.new(2) { 'P' }
q = Array.new(1) { 'Q' }
r = Array.new(6) { 'R' }
s = Array.new(4) { 'S' }
t = Array.new(6) { 'T' }
u = Array.new(4) { 'U' }
v = Array.new(2) { 'V' }
w = Array.new(2) { 'W' }
x = Array.new(1) { 'X' }
y = Array.new(2) { 'Y' }
z = Array.new(1) { 'Z' }

ALPHABET = [a, b, c, d, e, f, g, h, i, j, k, l, m, n,
            o, p, q, r, s, t, u, v, w, x, y, z].flatten

SCORE_CHART = [
  { 1 => %w[A E I O U L N R S T] },
  { 2 => %w[D G] },
  { 3 => %w[B C M P] },
  { 4 => %w[F H V W Y] },
  { 5 => %w[K] },
  { 8 => %w[J X] },
  { 10 => %w[Q Z] }
].freeze

# wave 1
def draw_letters
  ten_letters = ALPHABET.sample(10)
  return ten_letters
end

# wave 2
def uses_available_letters?(input, ten_letters)

  #declaring a variable, gets the result of the function
  # call counts_letters. count_letters is a function that takes an array of strings (i.e letters)
  letter_count = count_letters(ten_letters)

  input.each_char.all? do |letter|
    count = letter_count[letter]
    if count == 0
      false
    else
      count -= 1
      letter_count[letter] = count
      true
    end
  end
end

def count_letters(letters)
  #Creating a variable which gets a hash and will
  # return 0 if a key is missing
  letter_frequency = Hash.new(0)
  letters.each do |letter|
    count = letter_frequency[letter]
    count += 1
    letter_frequency[letter] = count
  end
  return letter_frequency
end

# wave 3
def score_word(word)
  word_array = word.upcase.split('')
  score = 0
  SCORE_CHART.length.times do |index|
    # nested iteration: for each letter in word_array, check if the letter is in the
    # value of the corresponding key-value pair, at make an array
    # (e.g., word_array = [H E L L O], when index = 0, check_letters = [E L L O] )
    check_letters = word_array.select { |letter| SCORE_CHART[index].values.flatten.include?(letter) }
    # after the iteration, if check_letters is empty, do nothing, otherwise
    # get the length of check_letters and multiply it by the corresponding key
    # (e.g., [E L L O].length = 4 and 4 * 1 = 4 (where 1 is the key that corresponds with the first
    # hash-element of SCORE_CHART))
    score += check_letters.length * SCORE_CHART[index].keys[0] unless check_letters.empty?
  end

  score += 8 unless word_array.length < 7

  return score
end

# wave 4
def highest_score_from(words)

  winning_info = {}
  high_score = 0
  high_score_word_length = 0

  # iterate through words (array of string-input) to find
  # winning word and its score - append into winning_info hash
  words.each do |word|
    score = score_word(word)

    if score > high_score
      high_score = score
      high_score_word_length = word.length
      winning_info = {
        word: word,
        score: score
      }
      # tie-breaker conditionals
    elsif (score == high_score) && (high_score_word_length < 10)
      if word.length < high_score_word_length
        winning_info = {
          word: word,
          score: score
        }

      elsif word.length == 10
        winning_info = {
          word: word,
          score: score
        }
      end
    end
  end

  return winning_info

end