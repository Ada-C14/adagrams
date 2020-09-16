
LETTERS = {
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

# WAVE 1
def draw_letters()
  all_letters = []

  # Creates an array of letters that matches the frequency listed in LETTERS
  LETTERS.each do |letter, frequency|
    frequency.times do
      all_letters << letter.to_s
    end
  end

  strings = all_letters.shuffle.first(10)
  return strings
end


# WAVE 2

def uses_available_letters?(input, letters_in_hand)
  input = input.chars

  if (input - letters_in_hand).size > 0
    return false
  else
    input.each do |letter|
      if input.count(letter) > letters_in_hand.count(letter)
        return false
      end
    end
    return true
  end
end

# Wave 3

def score_word(word)
  points = 0

  if word.length > 6
    points += 8
  end

  word.each_char do |letter|
    letter.upcase!
    if ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'].include? (letter)
      points += 1
    elsif ['D', 'G'].include? (letter)
      points += 2
    elsif ['B', 'C', 'M', 'P'].include? (letter)
      points += 3
    elsif ['F', 'H', 'V', 'W', 'Y'].include?(letter)
      points += 4
    elsif ['K'].include? (letter)
      points += 5
    elsif ['J', 'X'].include? (letter)
      points += 8
    elsif ['Q', 'Z'].include? (letter)
      points += 10
    end
  end

  return points
end

# Wave 4
# Use score_word function
# return { word: 'string', score: score_int }