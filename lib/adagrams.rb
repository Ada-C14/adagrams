# letters = {
#     A: 9,
#     B: 2,
#     C: 2,
#     D: 4,
#     E: 12,
#     F: 2,
#     G: 3,
#     H: 2,
#     I: 9,
#     J: 1,
#     K: 1,
#     L: 4,
#     M: 2,
#     N: 6,
#     O: 8,
#     P: 2,
#     Q: 1,
#     R: 6,
#     S: 4,
#     T: 6,
#     U: 4,
#     V: 2,
#     W: 2,
#     X: 1,
#     Y: 2,
#     Z: 1
# }
#
#
# def letters_arr(letters)
#   letter_array = []
#   letters.each do |letter, count|
#     count.times do
#       letter_array << letter.to_s
#       end
#     end
#   return letter_array
# end
#
# # p letters_arr(letters)
#
# def draw_letters
#   letters = {
#       A: 9,
#       B: 2,
#       C: 2,
#       D: 4,
#       E: 12,
#       F: 2,
#       G: 3,
#       H: 2,
#       I: 9,
#       J: 1,
#       K: 1,
#       L: 4,
#       M: 2,
#       N: 6,
#       O: 8,
#       P: 2,
#       Q: 1,
#       R: 6,
#       S: 4,
#       T: 6,
#       U: 4,
#       V: 2,
#       W: 2,
#       X: 1,
#       Y: 2,
#       Z: 1
#   }
#   letters_array = letters_arr(letters)
#   players_hand_arr = letters_array.sample(10)
#   return players_hand_arr
# end
#
# p draw_letters

# Input = user input of string word
# Letters in hand is the array of 10 string letters
# produced in 'draw_letters' method
#
# Hash for input word
# Hash for letters in hand
# Helper method - string to hash
#


# input = input.chars
# p input
#
input = [ "E", "E", "A"]

def input_helper_method(input)
  user_letters_hash = Hash.new(0)
  input.each { |letter| user_letters_hash[letter] += 1 }
  user_letters_hash
end


p input_helper_method(input)

play = input_helper_method(input)

letters_in_hand = ["A", "B","C", "D", "D", "D"]
def hand_helper_method(letters_in_hand)
  letters_in_hand_hash = Hash.new(0)
  letters_in_hand.each { |letter| letters_in_hand_hash[letter] += 1 }
  letters_in_hand_hash
end

deck = hand_helper_method(letters_in_hand)


def uses_available_letters?(play, deck)
  play.each do | letter , count |
    if deck[letter] < count
      return false
    end
  end
  return true
end

p uses_available_letters?(play, deck)



# def uses_available_letters?(input, letters_in_hand)
#   if hand_helper_method(letters_in_hand).include?
#       return true
#     else
#       return false
#     end
# end
#
# p def uses_available_letters?(input, letters_in_hand)

# def uses_available_letters?(input, letters_in_hand)
#   input = input.chars
#   p input
#   letters_in_hand do | letter |
#     if letters_in_hand.include? (letter)
#       return true
#     else
#       return false
#     end
#   end
# end
#
# p uses_available_letters?( "EEA", draw_letters)