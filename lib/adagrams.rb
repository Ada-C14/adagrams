LETTER_HASH = {
    a: 9,
    b: 2,
    c: 2,
    d: 4,
    e: 12,
    f: 2,
    g: 3,
    h: 2,
    i: 9,
    j: 1,
    k: 1,
    l: 4,
    m: 2,
    n: 6,
    o: 8,
    p: 2,
    q: 1,
    r: 6,
    s: 4,
    t: 6,
    u: 4,
    v: 2,
    w: 2,
    x: 1,
    y: 2,
    z: 1
}

def draw_letters
  letters = []
  LETTER_HASH.each do |letter, number|
    number.times do
      letters << "#{letter}"
    end
  end

  return letters.sample(10)
end

user_letters = draw_letters()
puts user_letters

puts "What is your word?"
user_input = gets.chomp

def uses_available_letters?(input, letters_in_hand)
  pp letters_in_hand
  letters_in_hand_copy = letters_in_hand[0..letters_in_hand.length]
  input_split = input.split("")
  input_split.each do |i|
    if letters_in_hand_copy.include?(i)
      letters_in_hand_copy.delete_at(letters_in_hand_copy.index(i))
    else
      return false
    end
  end
  pp letters_in_hand_copy
  pp letters_in_hand
  return true
end

puts uses_available_letters?(user_input, user_letters)
#   letter_array = letter_hash.map do |letter, number|
#     number.times do
#       "#{letter}"
#     end
#   end
# end



# Why is it not possible to access hash when defined above the method?
























# array = ["a", "a", "a", "b", "c", "d", "e"]
# #Does a method exist that takes into account probability into random generation?
# # --> India will look into
#
#
# array1 = [
#           ["a", "b", "c", "d", ...],
#           ["a", "b", "c", "d", ...],
#           ["a", "d", ...]...
#   ]
#
# data_structure = {a: 9/84, b:3/84, c:7, } #complicated to deduct
#
# data_structure = {a: 9, b:3, c:7, } #not weighted by probability
#
#
#
#
#
# hash * key


