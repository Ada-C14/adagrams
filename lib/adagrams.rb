

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




#   letter_array = letter_hash.map do |letter, number|
#     number.times do
#       "#{letter}"
#     end
#   end
# end

pp draw_letters


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


