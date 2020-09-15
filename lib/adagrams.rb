POOL = {
    "a": 9,
    "b": 2,
    "c": 2,
    "d": 4,
    "e": 12,
    "f": 2,
    "g": 3,
    "h": 2,
    "i": 9,
    "j": 1,
    "k": 1,
    "l": 4,
    "m": 2,
    "n": 6,
    "o": 8,
    "p": 2,
    "q": 1,
    "r": 6,
    "s": 4,
    "t": 6,
    "u": 4,
    "v": 2,
    "w": 2,
    "x": 1,
    "y": 2,
    "z": 1,
}

def draw_letters
  new_pool = POOL.clone
  new_pool = new_pool.map{|k, v| Array.new(v) {k.to_s}}
  new_pool.flatten!(1)
  return new_pool.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  new_letters = letters_in_hand.clone

  return false if input.length > new_letters.length

  input.each_char.with_index do |letter, index|
    unless new_letters.include?(letter)
      return false
    end
    new_letters[index] = nil
  end
  return true
end
