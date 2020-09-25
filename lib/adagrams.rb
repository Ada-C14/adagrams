def draw_letters
  letter_pool = []
  pool = {A:9,
          B:2,
          C:2,
          D:4,
          E:12,
          F:2,
          G:3,
          H:2,
          I:9,
          J:1,
          K:1,
          L:4,
          M:2,
          N:6,
          O:8,
          P:2,
          Q:1,
          R:6,
          S:4,
          T:6,
          U:4,
          V:2,
          W:2,
          X:1,
          Y:2,
          Z:1}
  pool.each do |letter, num|
    num.times do
      letter_pool << letter.to_s
    end
  end
  return letter_pool.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  result = []
  input_arr = input.split("")
  temp_pool = letters_in_hand.map do |letter|
    letter
  end
  input_arr.each do |letter|
    if temp_pool.include?(letter)
      temp_pool.slice!(temp_pool.index(letter))
      result << true
    else
      result << false
    end
  end
  if result.include?(false)
    return false
  else
    return true
  end
end

def score_word(word)
  word = word.upcase
  score_chart = {%w[A E I O U L N R S T] => 1,
                 %w[D G] => 2,
                 %w[B C M P ] => 3,
                 %w[F H V W Y] => 4,
                 %w[K] => 5,
                 %w[J X] => 8,
                 %w[Q Z] => 10}
  word_arr = word.split("")
  points = 0
  if word.length >= 7 && word.length <= 10
    points = 8
  end
  word_arr.each do |letter|
    score_chart.each do |key, value|
      if key.include?(letter)
        points = points + value
      end
    end
  end

  # print points
  return points
end
word = "abcdefghi"

score_word(word)

def highest_score_from(words)
  score_hash = {}

  words.each do |word|
    score_hash[word] = score_word(word)
  end
  # score_hash.each do
  # score_hash.sort_by {|word, score| word.length}
  # end
  # puts score_hash


  score = score_hash.values.max
  best_array = score_hash.select { |k, v| v == score }.keys

  best_words = {}
  best_array.each do |word|
    if word.length == 10
      best_words[:word] = word
      best_words[:score] = score
      return best_words
    end

  end

  best_array = best_array.sort_by {|word| word.length}



  best_words[:word] = best_array.first
  best_words[:score] = score
  return best_words

end

words = ['AAAAAAAAAA', 'EEEEEEEEEE']
print highest_score_from(words)