
def draw_letters
distribution = {
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
                Z: 1,
                }

  distribution_array = []
  distribution.each do |letter, number|
    number.times do
      distribution_array << letter.to_s
    end
  end

  letters = []

  # distribution_array.shuffle!
  # letters << distribution_array.first(10)
  # letters.flatten!

p distribution_array.length

  10.times do
    index = rand(0..distribution_array.length)
    letters << distribution_array[index]
    distribution_array.delete_at(index)
  end

p distribution_array.length


  return letters
end

puts draw_letters






