#wave 1

def draw_letters
  letters_pool = []

  letter_quantity = {"A": 9, "B": 2, "C": 2, "D": 4, "E": 12, "F": 2, "G": 3, "H": 2, "I": 9, "J": 1, "K": 1, "L": 4, "M": 2, "N": 6, "O": 8, "P": 2, "Q": 1, "R": 6, "S": 4, "T": 2, "U": 4, "V": 2, "W": 2, "X": 1, "Y": 2, "Z": 1}

  letter_quantity.each do |letter, qty|
    qty.times do
      letters_pool << letter.to_s
    end
  end

  #p letters_pool
  drawn_letters = letters_pool.sample(10)
  return drawn_letters
end

#wave 2
def uses_available_letters?(input, letters_in_hand)
  valid_letter = nil
  input_as_array = input.upcase.split("")

  hand = letters_in_hand

  input_as_array.each do |letter|
    if hand.include?(letter)
      #p letter
      index = hand.index(letter)
      hand.delete_at(index)
      #p letters_in_hand

      valid_letter = true
    else
      hand = letters_in_hand #trying to reset the hand
      puts "false value #{letter}"
      valid_letter = false
      #should add a break here?
    end
  end
  return valid_letter
end

