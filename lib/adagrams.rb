

def draw_letters
  letters_count = {"A": 9, "B": 2, "C": 2, "D": 4, "E": 12, "F": 2, "G": 3, "H": 2, "I": 9, "J": 1, "K": 1, "L": 4, "M": 2, "N": 6, "O": 8, "P": 2, "Q": 1, "R": 6, "S": 4, "T": 6, "U": 4, "V": 2, "W": 2, "X": 1, "Y": 2, "Z": 1}

  total_letters = []

  letters_count.each do |letter, number|
    number.times do
      total_letters << letter.to_s
    end
  end

  return total_letters.sample(10)

end


def uses_available_letters?(input, letters_in_hand)
  counter = 0
  counts = Hash.new(0)
  letters_in_hand.each do |letter|
    counts[letter] += 1
  end

  input.split("").each do |letter|
    if letters_in_hand.include?(letter)
      if counts[letter] > 0
        counts[letter] -= 1
      elsif counts[letter] == 0
        counter += 1
      end
    else
      counter += 1
    end
  end

  if counter > 0
    return false
  else
    return true
  end
end

def score_word(word)

  sum = 0
  scores_hash = {
      "A": 1, "E": 1, "I": 1, "O": 1, "U": 1, "L": 1, "N": 1, "R": 1, "S": 1, "T": 1, "D": 2, "G": 2, "B": 3, "C": 3, "M": 3, "P": 3,
      "F": 4, "H": 4, "V": 4, "W": 4, "Y": 4,"K": 5, "J": 8, "X": 8,"Q": 10, "Z": 10
  }

  new_arr = word.split("")
  new_arr.each do |letter|
    scores_hash.each do |char, score|
      if letter == char.to_s
        sum += score
      end
    end
  end

  return sum

end