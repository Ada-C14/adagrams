distribution = {A: 9,
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
                Z: 1,
}

def draw_letters(distribution)
  distribution_array = []
  distribution.each do |letter, number|
    number.times do
      distribution_array << letter.to_s
    end
  end

  letters = []

  distribution_array.shuffle!
  letters << distribution_array.first(10)
  letters.flatten!

  return letters
end

puts draw_letters(distribution)

# array = []
# until array.length == 10
#   rand_index = rand(0..(distribution_array.length - 1))
#   array << letter[rand_index]
#   distribution_array.delete(letter[rand_index])
# end
#
# # letters = distribution_array.sample(10)
#
# p array





