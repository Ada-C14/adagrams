require 'csv'

##################### wave 1
def draw_letters
  letter_pool = []

  9.times {letter_pool.push("A", "I")}
  2.times {letter_pool.push("B", "C", "F", "H", "M", "P", "V", "W", "Y" )}
  4.times {letter_pool.push("D", "L", "S", "U")}
  12.times {letter_pool << "E"}
  3.times {letter_pool << "G"}
  letter_pool << "J"
  letter_pool << "K"
  6.times {letter_pool.push("N", "R", "T")}
  8.times {letter_pool << "O"}
  letter_pool.push("Q", "X", "Z")

  drawn_letters = letter_pool.sample(10)
  return drawn_letters
end

####################### wave 2

def uses_available_letters?(input, letters_in_hand)
  input_letters = input.split("")
  if input_letters.length > 10
    puts "Oops, too many letters! You only have 10 :)"
    return false
  end

  if input_letters == input_letters.uniq
    if (input_letters - letters_in_hand).empty?
      return true
    else
      return false
    end
  else
    counts_input = input_letters.group_by {|letter| letter}
    counts_letterinhand = letters_in_hand.group_by {|letter| letter}

    counts_input.each_pair do |letter, count|
      if counts_input[letter].length > counts_letterinhand[letter].length
        puts "Looks like you use #{letter} too many times."
        return false
      end
    end

    return true
  end

end

############################# wave 3
def score_word(word)
  word = word.upcase
  input_letters = word.split("")
  score = 0
  if input_letters.length > 6
    score += 8
  end

  input_letters.each do |letter|

    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      score += 1
    when "D", "G"
      score += 2
    when "B", "C", "M", "P"
      score += 3
    when "F", "H", "V", "W", "Y"
      score += 4
    when "K"
      score += 5
    when "J", "X"
      score += 8
    when "Q", "Z"
      score += 10
    end


  end

  return score
end

######################### wave 4
def highest_score_from(words)
  word_score = {}
  words.each do |word|
    word_score[word] = score_word(word)
  end
  winner_random = word_score.max_by {|word, score| score}
  winner_random[0] = winner_random[0].to_s

  winner_all = word_score.select {|word, score| score == winner_random[1]}
  winner_final = {}

  if winner_all.length > 1
    ten_letter_words = winner_all.select {|word, score| word.size == 10}
    if ten_letter_words.empty?
      winner_final_candidates = winner_all
    else
      winner_final_candidates = ten_letter_words
    end

    winner_final[:word], winner_final[:score] = winner_final_candidates.min_by{|word, score| word.length}
  else
    winner_final[:word] = winner_all.keys.join
    winner_final[:score] = winner_all.values.join.to_i
  end

  return winner_final

end

######################### wave 5
def is_in_english_dict?(input)

  dictionary = CSV.read('../assets/dictionary-english.csv').map { |word| word.to_s }
  return dictionary.include?(input)

end
