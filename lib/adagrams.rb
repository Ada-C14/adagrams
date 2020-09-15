def draw_letters
  letter_pool = []
  pool = {A:9,
          B:2,
          C:2,
          D:4,
          E:12,
          F:2,
          G:3,
          H:2,
          I:9,
          J:1,
          K:1,
          L:4,
          M:2,
          N:6,
          O:8,
          P:2,
          Q:1,
          R:6,
          S:4,
          T:6,
          U:4,
          V:2,
          W:2,
          X:1,
          Y:2,
          Z:1}
  pool.each do |letter, num|
    num.times do
      letter_pool << letter.to_s
    end
  end
  return letter_pool.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  result = []
  input_arr = input.split("")
  temp_pool = letters_in_hand.map do |letter|
    letter
  end
  input_arr.each do |letter|
    if temp_pool.include?(letter)
      temp_pool.slice!(temp_pool.index(letter))
      result << true
    else
      result << false
    end
  end
  if result.include?(false)
    return false
  else
    return true
  end
end

