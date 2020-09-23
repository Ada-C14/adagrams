# Gessica Mohr and Pauline Chane (aka @GeMath18 and @Pauline Chane on GitHub)
# Ada Developers Academy C14
# Week 3 - Adagrams Pair Programming Project - adagrams.rb
# 09/18/2020

# for english dict
require "csv"

def draw_letters()
  # array of hash of hashes where letter points to key/value pairs for max # allowed and # used up in draw
  letter_array =[{"A"=>{"max_num" => 9,"num_used" => 0}},
                 {"B"=>{"max_num" => 2, "num_used" => 0}},
                 {"C"=>{"max_num" => 2, "num_used" => 0}},
                 {"D"=>{"max_num" => 4, "num_used" => 0}},
                 {"E"=>{"max_num" => 12, "num_used" => 0}},
                 {"F"=>{"max_num" => 2, "num_used" => 0}},
                 {"G"=>{"max_num" => 3, "num_used" => 0}},
                 {"H"=>{"max_num" => 2, "num_used" => 0}},
                 {"I"=>{"max_num" => 9, "num_used" => 0}},
                 {"J"=>{"max_num" => 1, "num_used" => 0}},
                 {"K"=>{"max_num" => 1, "num_used" => 0}},
                 {"L"=>{"max_num" => 4, "num_used" => 0}},
                 {"M"=>{"max_num" => 2, "num_used" => 0}},
                 {"N"=>{"max_num" => 6, "num_used" => 0}},
                 {"O"=>{"max_num" => 8, "num_used" => 0}},
                 {"P"=>{"max_num" => 2, "num_used" => 0}},
                 {"Q"=>{"max_num" => 1, "num_used" => 0}},
                 {"R"=>{"max_num" => 6, "num_used" => 0}},
                 {"S"=>{"max_num" => 4, "num_used" => 0}},
                 {"T"=>{"max_num" => 6, "num_used" => 0}},
                 {"U"=>{"max_num" => 4, "num_used" => 0}},
                 {"V"=>{"max_num" => 2, "num_used" => 0}},
                 {"W"=>{"max_num" => 2, "num_used" => 0}},
                 {"X"=>{"max_num" => 1, "num_used" => 0}},
                 {"Y"=>{"max_num" => 2,"num_used" => 0}},
                 {"Z"=>{"max_num" => 1, "num_used" => 0}}]
  # shovel array
  letter_bucket = []

  # doesn't exit loop until 10 letters have been successfully added
  while letter_bucket.length < 10
    temp_letter_hash = letter_array[rand(26)]
    temp_letter = temp_letter_hash.keys[0]

    # only adds letter if counter to add letter "num_used" would be less than or equal to max_num upon addition
    if temp_letter_hash[temp_letter]["num_used"] < temp_letter_hash[temp_letter]["max_num"]
      letter_bucket << temp_letter

      # increment num_used
      temp_letter_hash[temp_letter]["num_used"] += 1
    end
  end

  return letter_bucket
end

# verify if the letters in hand are included in the collection of available letters in the array. verify if they are an anagram of some or all of the given letters in hand.

def uses_available_letters?(input, letters_in_hand)
  letters_copy = letters_in_hand.clone # letters_in_hand will be kept the same even if any of the letters evals to false
  input.each_char { |o|
    index = letters_copy.find_index(o.upcase)
    if index.nil?
      return false
    else
      letters_copy.delete_at(index)
    end
  }
  return true
end

#using the score_word hash to find the score of each word.
def score_word(word)

  score_word = { "A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1, "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}

  score = word.length > 6 ? 8 : 0

  word.each_char{|c| score += score_word[c.upcase]}
  return score

end

# Takes array of words and returns the highest scoring word (based off score_word).
# In case of tiebreakers:
# Priority # 1: first word that appears with 10 letters wins
# Priority # 2: word with least amount of letters wins
# Priority # 3: first word that appears if all words are same length
def highest_score_from(words)

  # create array of hashes containing word and score
  word_score_hashes = words.map do |word|
    {:word => word, :score => score_word(word)}
  end

  # find hash with winning score
  winning_score = word_score_hashes.max_by{|word| word[:score]}

  # find word(s) with same winning_score
  winning_word = word_score_hashes.select{|word| word[:score] == winning_score[:score]}

  # if winning word is array, is a tie and all words have same score
  if winning_word.is_a?(Array)

    # create variable, array or single hash, of word(s) with smallest length
    smallest_winners = winning_word.min_by do |word|
      word[:word].length
    end

    # only the first of these elements matter if there are multiple, so if is array we only need the first element
    smallest_winners = smallest_winners[0] if smallest_winners.is_a?(Array)

    # create variable, array or single hash, of word(s) with length 10
    has_ten_letters = winning_word.select do |word|
      word[:word].length == 10
    end

    # cases for returning in case of tie:
    # no word with 10 letters
    if has_ten_letters.empty?
      # first appearing word with shortest length
      return smallest_winners
      # multiple words with ten letters
    elsif has_ten_letters.is_a?(Array)
      # return first that appears
      return has_ten_letters[0]
      # otherwise, only one word has 10 letters and auto-wins
    else
      return has_ten_letters
    end

  end

  # return for when only one high score found
  return winning_word
end

def is_in_english_dict?(input)
  eng_dict = CSV.read('assets/dictionary-english.csv')
  eng_dict.shift
  eng_dict.flatten!
  return eng_dict.include? input.downcase
end
