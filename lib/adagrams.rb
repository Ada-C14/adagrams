# Wave 1
LETTER_DISTRIB = {
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

def draw_letters
  letter_pool = LETTER_DISTRIB.flat_map { |letter_symbol, freq| [letter_symbol.to_s] * freq }

  user_hand = letter_pool.sample(10)

  return user_hand
end

# Wave 2
def uses_available_letters?(input, letters_in_hand)
  dup_hand = letters_in_hand.dup

  input.split("").each do |letter|
    if ! dup_hand.include?(letter)
      return false
    end

    dup_hand.delete_at(dup_hand.index(letter))
  end

  return true
end

# Wave 3
def score_word(word)
  score_chart = {
      1 => %w[A E I O U L N R S T],
      2 => %w[D G],
      3 => %w[B C M P],
      4 => %w[F H V W Y],
      5 => %w[K],
      8 => %w[J X],
      10 => %w[Q Z]
  }

  score = 0

  word.upcase.split("").each do |char|
    score_chart.each do |point_value, letters|
      if letters.include?(char)
        score += point_value
      end
    end
  end

  if word.length > 6 && word.length <= 10
    score += 8
  end

  return score
end

# Wave 4
def highest_score_from(words)
  scores = words.map { |word| score_word(word) }

  max_score = scores.max

  if scores.count(max_score) == 1
    return {
        word: words[scores.index(max_score)],
        score: max_score
    }
  else
    highest_scoring_words = words.select { |word| score_word(word) == max_score }

    tied_words_length = highest_scoring_words.map { |word| word.length }

    if tied_words_length.include?(10)
      return {
          word: highest_scoring_words[tied_words_length.index(10)],
          score: max_score
      }
    else
      return {
          word: highest_scoring_words[tied_words_length.index(tied_words_length.min)],
          score: max_score
      }
    end
  end
end

# Wave 5
require "csv"

def is_in_english_dict?(input)
  dictionary = CSV.read('../assets/dictionary-english.csv', headers: true).map { |word| word["Word"] }

  return dictionary.include?(input.downcase)
end