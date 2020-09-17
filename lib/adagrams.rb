letters = {
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


def letters_arr(letters)
  letter_array = []
  letters.each do |letter, count|
    count.times do
      letter_array << letter.to_s
    end
  end
  return letter_array
end

# p letters_arr(letters)

def draw_letters
  letters = {
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
  letters_array = letters_arr(letters)
  players_hand_arr = letters_array.sample(10)
  return players_hand_arr
end

# letters_in_hand = draw_letters

# letters_in_hand = ['D', 'O', 'G', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
# p letters_in_hand
#
# input = [ "D", "O", "G"]

def hash_headache(strings)
  letters_hash = Hash.new(0)
  strings.chars.each { |letter| letters_hash[letter] += 1 }
  letters_hash
end

def hashes_suck_too(array)
  deck_hash = Hash.new(0)
  array.each { |letter| deck_hash[letter] += 1 }
  deck_hash
end

# p hash_headache(letters_in_hand)
# deck = hash_headache(letters_in_hand)
# p deck

def uses_available_letters?(play, deck)
  hand = hash_headache(play)
  pool = hashes_suck_too(deck)
  hand.each do | letter , count |
    # p letter
    # p count
    # p hand
    # p deck
    # p play
    # p pool
    if pool[letter] < count
      return false
    end
  end
  return true
end

def score_word(word)
  scores = {
      A: 1,
      B: 3,
      C: 3,
      D: 2,
      E: 1,
      F: 4,
      G: 2,
      H: 4,
      I: 1,
      J: 8,
      K: 5,
      L: 1,
      M: 3,
      N: 1,
      O: 1,
      P: 3,
      Q: 10,
      R: 1,
      S: 1,
      T: 1,
      U: 1,
      V: 4,
      W: 4,
      X: 8,
      Y: 4,
      Z: 10
  }

score_total = word.upcase.chars.map { |char| scores[char.to_sym] }.sum
  if word.length >= 7
    score_total += 8
  end
return score_total
end



# if (7..10).include?(word.length)
#   score = word.length * score
#   score_total += score
#
#
# word_length_bonus = [7, 8, 9, 10]
# if word_length_bonus.length.include?(word.length)
#   score_total += 8
# end

#if the length of the word is 7, 8, 9, 10 word gets additional 8 points



#   word.length.times do
#     score_total = 0
#     word.upcase.chars.each do |char|
#       score_total += scores[char]
#       p scores[char]
#       p score_total
#       p word
#       end
#     return score_total
#   end
# end


#score_total = word.upcase.chars.map { |char| scores[:char] }.sum

#
#     word = word.upcase.chars  #String letters in array = char
#     word.map do |chars|
#
#     end
#       if chars = scores[chars.to_sym]
#       end
#       score = word.upcase.chars.map { |scores| scores[:char] }
#   end
# end
#
#
# ## Collect all the words played each element a word string
# # words = []
# #
# def highest_score_from(words)
#
# end
