require 'csv'

ALL_LETTERS = {
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
    Z: 1
}

SCORE_CHART = {
    A: 1,
    B: 3,
    C: 3,
    D: 2,
    E: 1,
    F: 4,
    G: 2,
    H: 4,
    I: 1,
    J: 8,
    K: 5,
    L: 1,
    M: 3,
    N: 1,
    O: 1,
    P: 3,
    Q: 10,
    R: 1,
    S: 1,
    T: 1,
    U: 1,
    V: 4,
    W: 4,
    X: 8,
    Y: 4,
    Z: 10
}

def draw_letters
  all_letters = []

  ALL_LETTERS.each do |keys, values|
    values.times do
      all_letters << keys.to_s
    end
  end

  return all_letters.shuffle.first(10)
end

def count_letters(letters_array)
  letter_count = {}

  letters_array.each do |letter|
    if letter_count.include? letter
      letter_count[letter] += 1
    else
      letter_count[letter] = 1
    end
  end

  return letter_count
end

def uses_available_letters?(input, letters_in_hand)
  input = input.split('')
  hand_count = count_letters(letters_in_hand)
  input_count = count_letters(input)

  #check if each letter in input is in hand or if letter count in input is <= in hand
  input_count.each do |letter, count|
    if !hand_count.key?(letter) || count > hand_count[letter]
      return false
    end
  end

  return true
end

def score_word(word)
  score = 0

  if word.length >= 7 && word.length <= 10
    score += 8
  end

  letters = word.upcase.split("").map { |letter| letter.to_sym }

  letters.each do |letter|
    if letter
      score += SCORE_CHART[letter]
    else
      return
    end
  end

  return score
end

def highest_score_from(words)
  highest_score = { word: "", score: 0 }
  words.each do |word|
    word_value = score_word(word)
    if word_value > highest_score[:score]
      highest_score[:score] = word_value
      highest_score[:word] = word
    elsif (word_value == highest_score[:score]) && (highest_score[:word].length != 10)
      if (word.length == 10) || (word.length < highest_score[:word].length)
        highest_score[:score] = word_value
        highest_score[:word] = word
      end
    end
  end

  return highest_score
end

def is_english_dict?(input)
  input = input.downcase
  CSV.read("../assets/dictionary-english.csv", headers: true).each do |word|
    word["Word"] == input ? (return true) : next
  end

  return false
end

#MAIN PROGRAM#################
# hand = draw_letters
# print "Here are your letters #{hand}, input an anagram: "
# anagram = gets.chomp.upcase
# words = ["AAAAA", "EEEEE"]
# while anagram != 'Q'
#   if uses_available_letters?(anagram, hand)
#     words << anagram
#     puts "Please input another anagram, or enter 'q' to proceed: "
#   else
#     puts "Invalid anagram. Please try again, or enter 'q' to proceed: "
#   end
#   anagram = gets.chomp.upcase
# end

# puts "The highest scoring word is: #{highest_score_from(words)}"
#
p is_english_dict?('aaa')