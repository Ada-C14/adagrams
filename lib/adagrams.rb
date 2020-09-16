
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

  until true
    puts "invalid entry. would you like to try again?"

# until true
#   score = score
#   puts "Your word was accepted!"
#   puts "Would you like to enter another word? Enter 'yes' to continue"
#   input = gets.chomp
# else
#   score = 0
#   puts "Your word uses letters not included in your hand."
#   puts "Would you like to try again? enter 'yes' to continue"
#   input = gets.chomp
#     if input != 'yes'
#       break
#     end
# end


puts uses_available_letters?(word_hash, letter_hash)

def score_word(word)
values = {
          "A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
          "D" => 2, "G" => 2,
          "B" => 3, "C" => 3, "M" => 3, "P" => 3,
          "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4,
          "K" => 5,
          "J" => 8, "X" => 8,
          "Q" => 10, "Z" => 10
          }

  score = 0
  values.each do |letter, value|
    score += (word[letter] * values[letter])
  end

  if word.length >= 7
    score += 8
  end

  return score
end

puts score_word(word_hash)

