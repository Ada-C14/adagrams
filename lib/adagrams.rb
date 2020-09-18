def draw_letters
  distribution = {
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
      Z: 1,
  }
  distribution_array = []
  distribution.each do |letter, number|
    number.times do
      distribution_array << letter.to_s
    end
  end

  drawn_letters = []
  10.times do
    index = rand(0...distribution_array.length)
    drawn_letters << distribution_array[index]
    distribution_array.delete_at(index)
  end
  return drawn_letters
end

def uses_available_letters?(input, letters_in_hand)
  input_hash = Hash.new(0)
  input.upcase!
  input = input.split('')
  input.each do |letter|
    input_hash[letter] += 1
  end

  input = input_hash
  letter_hash = Hash.new(0)
  letters_in_hand.each do |letter|
    letter_hash[letter] += 1

  end
  letters_in_hand = letter_hash
  input.each do |letter, count|
    if letters_in_hand[letter] < count
      return false
    end
  end
  return true
end

def score_word(word)
  if word.length >= 7
    score = 8
  else
    score = 0
  end

  hash = Hash.new(0)
  word.upcase!
  word = word.split('')
  word.each do |letter|
    hash[letter] += 1
  end

  word = hash
  values = {
      "A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
      "D" => 2, "G" => 2,
      "B" => 3, "C" => 3, "M" => 3, "P" => 3,
      "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4,
      "K" => 5,
      "J" => 8, "X" => 8,
      "Q" => 10, "Z" => 10
  }

  values.each do |letter, value|
    score += (word[letter] * values[letter])
  end
  return score
end


def highest_score_from(words)

  best_word = Hash.new

  best_score = 0
  winning_word = ""

  words.each do |word|
    score = score_word(word)
    if score > best_score
      best_score = score
      winning_word = word
    elsif word.length == 10 && score == best_score && winning_word.length < 10
      winning_word = word
      best_score = score
    elsif score == best_score && word.length < winning_word.length && winning_word.length != 10
      winning_word = word
      best_score = score
    end
  end

  best_word[:word] = winning_word
  best_word[:score] = best_score

  return best_word
end
