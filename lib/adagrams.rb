require 'csv'
# require '../test/Rakefile'
require 'rake/testtask'
#WAVE 1
def draw_letters
  letters = ('A'..'Z').to_a
  tally = [9,2,2,4,12,2,3,2,9,1,1,4,2,6,8,2,1,6,4,6,4,2,2,1,2,1]
  zipped = Hash[letters.map.zip(tally)]

  available_letters = zipped.each_with_object([]) do |(letter, amount), array|
    array << (letter * amount).split("")
  end

  available_letters.flatten! #array that holds each letter times the paired value

  hand = available_letters.sample(10)

  return hand #array
end

puts draw_letters

#WAVE 2
def uses_available_letters?(word, letters_in_hand)
  word_array = word.split('')

  # word_tally = Hash.new(0)
  # word_array.each { |letter| word_tally[letter] += 1 }

  letters_tally = Hash.new(0)
  letters_in_hand.each { |letter| letters_tally[letter] += 1 }

  word_array.each do |letter|
    letters_tally[letter] -= 1
  end

  puts letters_tally

  letters_tally.each do |letter , count|
    if letters_tally[letter] < 0
      return false
    end
  end
  return true
end

#WAVE 3
def score_word(word)
  input = word.upcase.split("")
  sum = 0
  # i = 0
  input.each do |letter|

    case letter
    when "Q", "Z"
      sum += 10
    when "D", "G"
      sum += 2
    when "B", "C", "M", "P"
      sum += 3
    when "F", "H", "V", "W", "Y"
      sum += 4
    when "K"
      sum += 5
    when "J", "X"
      sum += 8
    else #"A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      sum += 1
    end
    # i += 1
  end

  sum += 8 if input.length > 6

  return sum
end



#WAVE 4
def highest_score_from(words_array) #recives all_hands
  # max_score = words_array.group_by { |x| x[:score] }.max
  print "******"
  print words_array
  max_score = 0
  words_array.each do |hash|
    if hash[:score] > max_score
      max_score = hash[:score]
    end
  end
  print max_score
  # print max_score

  highest_scoring = words_array.select { |h| h[:score] == max_score }.map { |h| h } #array of hashes

  winning_words = [] #catches 10 letter words

  highest_scoring.map do |word_w_score|
    if word_w_score[:word].length == 10
      winning_words << word_w_score
    end
  end

  if winning_words.empty?
    return highest_scoring.first
  else
    return winning_words.first
  end
end

#WAVE 5
# def is_in_english_dict?(input)
#   CSV.open("assets/dictionary-english.csv", "r").each do |word| #stands for row
#   return true if word.include?(input.downcase)
#   end
#   return false
# end

#start game



print "How many hands would you like to draw? => "
number_of_hands = gets.chomp.to_i

all_hands = []

number_of_hands.times do

  p draw_letters



  puts "Word?"
  word = gets.chomp
  # puts uses_available_letters?(word, draw_letters)
  # puts is_in_english_dict?(word)
  all_hands << word
  #

  # one_word = { :word => word, :score => score_word(word) }
  # all_hands << one_word



end

puts highest_score_from(all_hands)

