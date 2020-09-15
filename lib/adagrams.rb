def draw_letters()
  letters = {
      "A" => 9,
      "B" => 2,
      "C" => 2,
      "D" => 4,
      "E" => 12,
      "F" => 2,
      "G" => 3,
      "H" => 2,
      "I" => 9,
      "J" => 1,
      "K" => 1,
      "L" => 4,
      "M" => 2,
      "N" => 6,
      "O" => 8,
      "P" => 2,
      "Q" => 1,
      "R" => 6,
      "S" => 4,
      "T" => 6,
      "U" => 4,
      "V" => 2,
      "W" => 2,
      "X" => 1,
      "Y" => 2,
      "Z" => 1
  }

  pool_of_letters = []
  letters.each do |letter, quantity|
    pool_of_letters.concat(Array.new(quantity, letter))
  end


  letters_in_hand = pool_of_letters.sample(10)
  return letters_in_hand
end

p letters_in_hand = draw_letters()


def uses_available_letters?(input, letters_in_hand)



  letters_in_hand_hash = Hash.new(0)

  letters_in_hand.each do |letter|
    letters_in_hand_hash[letter] += 1
  end

  input_array = []
  input_array = input.upcase.split(//)
  input_hash = Hash.new(0)

  input_array.each do |letter|
    count_of_letter = input_array.count(letter)
    input_hash[letter] = count_of_letter
  end



# Returns false if there is a letter in input that is not present in the letters_in_hand
  input_array.each do |letter|
    if !letters_in_hand_hash.has_key?(letter)
      return false
    end
  end


  input_hash.each do |letter, count|
    count_of_letter_in_input = input_hash[letter]
    count_of_letter_in_hand = letters_in_hand_hash[letter]

    if  count_of_letter_in_input > count_of_letter_in_hand
      return false
    end
  end

  return false if input.length == 0

  return true
end

p uses_available_letters?("hi",["A", "E", "O", "R", "G", "S", "E", "E", "J", "T"])
