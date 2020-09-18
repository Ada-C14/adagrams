# WAVE 1

def draw_letters
  letter_pool = %w(
  A A A A A A A A A
  B B
  C C
  D D D D
  E E E E E E E E E E E E
  F F
  G G G
  H H
  I I I I I I I I I
  J
  K
  L L L L
  M M
  N N N N N N
  O O O O O O O O
  P P
  Q
  R R R R R R
  S S S S
  T T T T T T
  U U U U
  V V
  W W
  X
  Y
  Z
)
  return letter_pool.sample(10)

end

# WAVE 2

def uses_available_letters?(input, letters_in_hand)

  new_letters_in_hand = letters_in_hand.dup

  input.upcase.chars.each do |character|
    if new_letters_in_hand.include?(character)
      position = new_letters_in_hand.index(character)
      new_letters_in_hand.delete_at(position)
    else
      return false
    end
  end
  return true
end

# WAVE 3
#
def score_word(word)

  score = 0

  word_char_array = word.upcase.chars

  word_char_array.each do |character|
    case character
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

  if word_char_array.length >= 7
    score += 8
  end

  return score
end


# WAVE 4

def highest_score_from(words)

  winner = {word: nil, score: 0}
  words.each do |word|

    if score_word(word) > winner[:score]
      winner[:word] = word
      winner[:score] = score_word(word)
    elsif score_word(word) == winner[:score]
      if ((winner[:word]).length != 10) && (word.length < (winner[:word]).length || word.length == 10 )
        winner[:word] = word
        winner[:score] = score_word(word)
      end
    end
  end
  return winner
end