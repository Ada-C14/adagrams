# create draw_letters method
def draw_letters
  hand_of_letters = []
  pool_of_letters = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 }
  pool_of_letters.each do |letter, quantity|
    quantity.times do
      hand_of_letters << letter.to_s
    end
  end
  return hand_of_letters.sample(10)
end

def uses_available_letters?(input, letters_in_hand)

  letters_arr = input.upcase.split("")
  true_false_arr = []
  copy_hand = letters_in_hand.clone

  letters_arr.each do |letter|
   true_false_arr << copy_hand.include?(letter)
   copy_hand.delete(letter)
  end

  if true_false_arr.all?(true)
    return true
  else
    return false
  end
end

def score_word(word)
  letters_and_value = {
      1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
      2 => ["D", "G"],
      3 => ["B", "C", "M", "P"],
      4 => ["F", "H", "V", "W", "Y"],
      5 => ["K"],
      8 => ["J", "X"],
      10 => ["Q", "Z"]
  }

  letters_arr = word.upcase.chars
  score = 0
  letters_arr.each do |letter|
    letters_and_value.each do |num, letters|
      if letters.include?(letter)
        score += num
      end
    end
  end

  score += 8 if word.length >=7

  return score
end
