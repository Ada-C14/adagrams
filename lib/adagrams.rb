# makes an array of all possible letters


def draw_letters
  # p letter_pool
  letter_pool = []
  letter_pool_hash = {
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

  letter_pool_hash.each do |letter, frequency|
    frequency.times { letter_pool << letter.to_s }
  end

  random_letter = letter_pool.shuffle.take(10)
  return random_letter
end

def uses_available_letters?(input, letters_in_hand)
  letters_in_hand_copy = letters_in_hand.clone
  input.each_char do |letter|
    if letters_in_hand_copy.include?(letter)
      letters_in_hand_copy.delete(letter)
    else
      return false
    end
  end
  return true
end