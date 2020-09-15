ALL_LETTERS = {
    A: 9,
    B: 2,
    C: 2,
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

def draw_letters
  all_letters = []

  ALL_LETTERS.each do |keys, values|
    values.times do
      all_letters << keys.to_s
    end
  end

  return all_letters.shuffle.first(10)
end

def count_letters(letters_array)
  letter_count = {}

  letters_array.each do |letter|
    if letter_count.include? letter
      letter_count[letter] += 1
    else
      letter_count[letter] = 1
    end
  end

  return letter_count
end


def uses_available_letters?(input, letters_in_hand)
  input = input.split('')
  hand_count = count_letters(letters_in_hand)  # ['A', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
  input_count = count_letters(input)  # { 'A' => 3 }

  #check if each letter in input is in hand or if letter count in input is <= in hand
  input_count.each do |letter, count|
    if !hand_count.key?(letter) || count > hand_count[letter]
      return false
    end
  end

  return true
end

#MAIN PROGRAM#################
hand = draw_letters
print "Here are your letters #{hand}, input an anagram: "
anagram = gets.chomp.upcase
p uses_available_letters?(anagram, hand)