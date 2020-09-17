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

letters_in_hand = ['D', 'O', 'G', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
p letters_in_hand

input = [ "D", "O", "G"]

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
    p letter
    p count
    p hand
    p deck
    p play
    p pool
    if pool[letter] < count
      return false
    end
  end
  return true
end


def score_word(word)
  scores = {
      1: "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      2: "D", "G",
      3: "B", "C", "M", "P"
      4: "F", "H", "V", "W", "Y",
      5: "K",
      8: "J", "K",
      10: "Q", "Z"
  }
  word.length.times do |score|

  end
end


## Collect all the words played each element a word string
# words = []
#
def highest_score_from(words)

end