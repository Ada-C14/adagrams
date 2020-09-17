

def draw_letters
  letter_hash = {
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

  letter_array = []
  letter_hash.each do |letter, number|
    number.times do
      letter_array << "#{letter}"
    end
  end

  my_array = letter_array.sample(10)

  return my_array

end

puts draw_letters

puts "What is your word?"
user_input = gets.chomp
def uses_available_letters?(input, letters_in_hand)
  input_split = input.split(//)
  input_split.each do |i|
    if letters_in_hand.include?(i)
      my_array.delete_at(my_array.index(i))
    else
      return False
    end
  end
  return True
end

puts uses_available_letters?(user_input, my_array)
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


