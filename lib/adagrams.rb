# wave 1
def draw_letters
  letters_array = [
    "A", "A", "A", "A", "A", "A", "A", "A", "A",
    "B", "B", 
    "C", "C", 
    "D", "D", "D", "D",
    "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
    "F", "F",
    "G", "G", "G",
    "H", "H",
    "I", "I", "I", "I", "I", "I", "I", "I", "I",
    "J",
    "K",
    "L", "L", "L", "L",
    "M", "M",
    "N", "N", "N", "N", "N", "N",
    "O", "O", "O", "O", "O", "O", "O", "O",
    "P", "P",
    "Q", 
    "R", "R", "R", "R", "R", "R",
    "S", "S", "S", "S", 
    "T", "T", "T", "T", "T", "T",
    "U", "U", "U", "U",
    "V", "V", 
    "W", "W",
    "X", 
    "Y", "Y", 
    "Z" 
    ]

  letters = letters_array.shuffle.pop(10)

  return letters
end

# wave 2
puts "Enter in a word: "
input = gets.chomp.to_s

letters_in_hand = input.split(//)
print letters_in_hand

def uses_available_letters?(input, letters_in_hand)
  check_input = input.split(//)

  my_letters_in_hand = Array.new(letters_in_hand)

  check_input.each do |letter|
    letter_index = my_letters_in_hand.find_index(letter)

    if letter_index == nil
      return false
    end

    my_letters_in_hand.delete_at(letter_index)
  end

  return true
end

# wave 3
def score_word(word)
  # check_input = word.split(//)
  # print check_input
  score = 0
  word.split(//).each do |letter|
    case letter.upcase
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

  if word.length >= 7 && word.length <= 10
    score += 8
  end

  return score
end

# wave 4
def highest_score_from(words)
  highest_score = 0
  highest_score_length = 0
  highest_word = nil

  words.each do |word|
  score = score_word(word)

    if highest_score < score
      highest_score = score
      highest_word = word
      highest_score_length = word.length
    elsif highest_score == score && highest_score_length != 10
      if word.length == 10
        highest_score_length = word.length
        highest_word = word
      elsif word.length < highest_word.length
        highest_score_length  = word
        highest_word = word
      end
    end
  end

  highest_score_hash = {
      :word => highest_word,
      :score => highest_score
  }
end
