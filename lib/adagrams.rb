
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

  10.times do
    index = rand(0...distribution_array.length)
    letters << distribution_array[index]
    distribution_array.delete_at(index)
  end

  return letters
end


def make_count_hash(array)
  hash = Hash.new(0)
  array.each do |letter|
    hash[letter] += 1
  end
  return hash
end


letters = draw_letters
letter_hash = make_count_hash(letters)

p letters

word = gets.chomp.upcase!
word = word.split('')
word_hash = make_count_hash(word)

puts word_hash
puts letter_hash

def uses_available_letters?(word_hash, letter_hash)
  word_hash.each do |letter, count|
    if letter_hash[letter] < count
      return false
    end
  end
  return true
end

puts uses_available_letters?(word_hash, letter_hash)

# letters = draw_letters
# hand_hash = hand_letter_count_hash(letters)
# word_hash = word_letter_count_hash(word)
#


# def uses_available_letters?(word, letters_in_hand)
#   letters_in_hand.each_with_index do |letter_in_hand, i|
#     if word.upcase.include?(letter_in_hand)
#       letters_in_hand.delete_at(i)
#     end
#   end
#   return letters_in_hand.length == 10 - word.length
# end
#

# letters_in_hand = draw_letters

# puts "here are your available letters!"
# p letters_in_hand
#
# puts "try a word"
#
# puts uses_available_letters?(word, letters_in_hand)
