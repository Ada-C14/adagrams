def draw_letters()
  letters = {
      "A" => 9,
      "B" => 2,
      "C" => 2,
      "D" => 4,
      "E" => 12,
      "F" => 2,
      "G" => 3,
      "H" => 2,
      "I" => 9,
      "J" => 1,
      "K" => 1,
      "L" => 4,
      "M" => 2,
      "N" => 6,
      "O" => 8,
      "P" => 2,
      "Q" => 1,
      "R" => 6,
      "S" => 4,
      "T" => 6,
      "U" => 4,
      "V" => 2,
      "W" => 2,
      "X" => 1,
      "Y" => 2,
      "Z" => 1
  }

  pool_of_letters = []
  letters.each do |letter, quantity|
    pool_of_letters.concat(Array.new(quantity, letter))
  end

  letters_in_hand = pool_of_letters.sample(10)
  return letters_in_hand
end


def uses_available_letters?(input, letters_in_hand)

  letters_in_hand_hash = Hash.new(0)

  letters_in_hand.each do |letter|
    letters_in_hand_hash[letter] += 1
  end

  input_array = input.upcase.split(//)
  input_hash = Hash.new(0)

  input_array.each do |letter|
    count_of_letter = input_array.count(letter)
    input_hash[letter] = count_of_letter
  end


  input_array.each do |letter|
    if !letters_in_hand_hash.has_key?(letter)
      return false
    end
  end


  input_hash.each do |letter, count|
    count_of_letter_in_input = input_hash[letter]
    count_of_letter_in_hand = letters_in_hand_hash[letter]

    if  count_of_letter_in_input > count_of_letter_in_hand
      return false
    end
  end

  return false if input.length == 0

  return true
end


def score_word(word)
  letters_cost = {
      "A" => 1,
      "E" => 1,
      "I" => 1,
      "O" => 1,
      "U" => 1,
      "L" => 1,
      "N" => 1,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "D" => 2,
      "G" => 2,
      "B" => 3,
      "C" => 3,
      "M" => 3,
      "P" => 3,
      "F" => 4,
      "H" => 4,
      "V" => 4,
      "W" => 4,
      "Y" => 4,
      "K" => 5,
      "J" => 8,
      "X" => 8,
      "Q" => 10,
      "Z" => 10,
      }


  letters = word.upcase.split(//)
  score = 0

  letters.each do |letter|
    score += letters_cost[letter]
  end


  if letters.length < 11 && letters.length > 6
    score += 8
  end
  return score
end


def highest_score_from(words)

  word_score_hash = Hash.new(0)

  words.each do |word|
    score = score_word(word)
    word_score_hash[word] = score
  end

  sorted_word_score_array = word_score_hash.sort_by { |word, score| score }

  highest_score = sorted_word_score_array[-1][-1]

  sorted_word_score_hash = sorted_word_score_array.to_h

  tie_hash = {}
  sorted_word_score_hash.each do |word, score|
    if highest_score == score
      tie_hash[word] = score
    end
  end

  winner = {}
  num_of_highest_scorers = tie_hash.length
  if num_of_highest_scorers > 1
    tie_hash.each do |word, score|
      if word.length == 10
        return winner = { word: word, score: score }
      end
    end

    ties_sorted_by_length = (tie_hash.sort_by { |word, score| word.length }).to_h
    shortest_highest_scorer = ties_sorted_by_length.first
    word = shortest_highest_scorer[0]
    score = shortest_highest_scorer[1]
    winner = { word: word, score: score }
    return winner

  else
    tie_hash.each do |word, score|
      winner = { word: word, score: score }
    end
    return winner
  end

  # if multiple words have the same length and score, the first supplied word is the winner
  if winner.empty?
    first_highest_scorer = tie_hash.first
    word = first_highest_scorer[0]
    score = first_highest_scorer[1]
    puts "We're in here!"
    return winner = { word: word, score: score }
  end

  return winner
end