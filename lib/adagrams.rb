# Creates an array of letters based on the quantity of letters given
def letters_arr(letters)
  letter_array = []
  letters.each do |letter, count|
    count.times do
      letter_array << letter.to_s
    end
  end
  return letter_array
end

# Generates a letters array using previous method and selects 10 random letters
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

# Helper methods produces letter-count hash by iterating through a given string
def word_to_letter_with_count_hash(strings)
  letters_hash = Hash.new(0)
  strings.chars.each { |letter| letters_hash[letter] += 1 }
  letters_hash
end

# Helper method produces letter count by iterating through a given array
def letter_with_count_hash(array)
  deck_hash = Hash.new(0)
  array.each { |letter| deck_hash[letter] += 1 }
  deck_hash
end

# Verifies that what cards player played were in their hand
def uses_available_letters?(play, deck)
  hand = word_to_letter_with_count_hash(play)
  pool = letter_with_count_hash(deck)
  hand.each do | letter , count |
    if pool[letter] < count
      return false
    end
  end
  return true
end

# Scores the word the player played
# Factors in bonus points
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

# Produced the highest score in the game
# Takes into account ties and exceptions (10 letter words)
def highest_score_from(words)
  # initialize
  greatest_score = score_word(words[0])
  greatest_score_pair = {word: words[0], score: greatest_score}

  #looping through all the words
  words.each do |word|
    if score_word(word) > greatest_score
      greatest_score = score_word(word)
      greatest_score_pair = {word: word, score: score_word(word)}
    elsif score_word(word) == greatest_score
      # 1 if the current great score word is 10 letters, keep it
      # 2 elsif the word_score_hash word is 10 letters, that's it
      # 3 elsif the word_score_hash word.length < current greatest word.length, that's it
      if greatest_score_pair[:word].length == 10
        greatest_score_pair = greatest_score_pair
      elsif word.length == 10
        greatest_score_pair = {word: word, score: score_word(word) }
      elsif word.length < greatest_score_pair[:word].length
        greatest_score_pair = {word: word, score: score_word(word) }
      end
    end
  end
  return greatest_score_pair
end