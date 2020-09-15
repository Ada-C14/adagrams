POOL = {
    "a": 9,
    "b": 2,
    "c": 2,
    "d": 4,
    "e": 12,
    "f": 2,
    "g": 3,
    "h": 2,
    "i": 9,
    "j": 1,
    "k": 1,
    "l": 4,
    "m": 2,
    "n": 6,
    "o": 8,
    "p": 2,
    "q": 1,
    "r": 6,
    "s": 4,
    "t": 6,
    "u": 4,
    "v": 2,
    "w": 2,
    "x": 1,
    "y": 2,
    "z": 1,
}

def draw_letters
  new_pool = POOL.clone
  new_pool = new_pool.map{|k, v| Array.new(v) {k.to_s}}
  new_pool.flatten!(1)
  return new_pool.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  new_letters = letters_in_hand.clone

  return false if input.length > new_letters.length

  input.each_char.with_index do |letter, index|
    unless new_letters.include?(letter)
      return false
    end
    new_letters[index] = nil
  end
  return true
end

def score_word(word)
  score = 0
  word.upcase!
  word.each_char do |char|
    case char
    when /[AEIOULNRST]/
      score += 1
    when /[DG]/
      score += 2
    when /[BCMP]/
      score += 3
    when /[FHVWY]/
      score += 4
    when /[K]/
      score += 5
    when /[JX]/
      score += 8
    when /[QZ]/
      score += 10
    end
  end

  extra_points = [7, 8, 9, 10]
  if extra_points.include?(word.length)
    score += 8
  end
  return score
end


def find_winner(length, winning_hash, max_score)
  winning_words = []
  winning_hash.each_key do |word|
    winning_words << word if word.length == length
  end

  unless winning_words.empty?
    winner = {
        word: winning_words[0],
        score: max_score
    }
    return winner
  end
  return nil
end


def highest_score_from(words)

  scores = words.map{|word| score_word(word)}
  max_hash = Hash[words.zip scores]

  max_score = max_hash.max_by{|k, v| v}[1]
  winning_hash = max_hash.keep_if{|k, v| v == max_score}

  smallest_length = winning_hash.min_by { |k, v| k.length}[0].length

  winner = find_winner(10, winning_hash, max_score)
  return winner if winner != nil

  return find_winner(smallest_length, winning_hash, max_score)
end