LETTER_HASH = {
    a: 9,
    b: 2,
    c: 2,
    d: 4,
    e: 12,
    f: 2,
    g: 3,
    h: 2,
    i: 9,
    j: 1,
    k: 1,
    l: 4,
    m: 2,
    n: 6,
    o: 8,
    p: 2,
    q: 1,
    r: 6,
    s: 4,
    t: 6,
    u: 4,
    v: 2,
    w: 2,
    x: 1,
    y: 2,
    z: 1
}

def draw_letters
  letters = []
  LETTER_HASH.each do |letter, number|
    number.times do
      letters << "#{letter}"
    end
  end

  return letters.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  letters_in_hand_copy = letters_in_hand[0..letters_in_hand.length]
  input_split = input.split("")
  input_split.each do |i|
    if letters_in_hand_copy.include?(i)
      letters_in_hand_copy.delete_at(letters_in_hand_copy.index(i))
    else
      return false
    end
  end
  return true
end

def score_word(word)
  word_split = word.downcase.split("")
  score = 0
  word_split.each do |letter|
    case letter
    when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
      score += 1
    when "d", "g"
      score += 2
    when "b", "c", "m", "p"
      score += 3
    when "f", "h", "v", "w", "y"
      score += 4
    when "k"
      score += 5
    when "j", "x"
      score += 8
    when "q", "z"
      score += 10
    end
  end

  if word_split.length > 6 && word_split.length < 11
    score += 8
  end

  return score

end

def highest_score_from(words)
  word_scores = []
  words.each do |word|
    each_word = {}
    each_word[:word] = word
    each_word[:score] = score_word(word)
    word_scores << each_word
  end

  highest_score_word = ''
  highest_score = 0
  winning_word = {}
  word_scores.each do |word|
    if word[:score] > highest_score
      highest_score_word = word[:word]
      highest_score = word[:score]
    elsif word[:score] == highest_score
      if word[:word].length == 10 && highest_score_word.length != 10
        highest_score_word = word[:word]
        highest_score = word[:score]
      elsif (word[:word].length < highest_score_word.length) && highest_score_word.length != 10
        highest_score_word = word[:word]
        highest_score = word[:score]
      end
    end
  end
  winning_word[:word] = highest_score_word
  winning_word[:score] = highest_score
  return winning_word
end

























# array = ["a", "a", "a", "b", "c", "d", "e"]
# #Does a method exist that takes into account probability into random generation?
# # --> India will look into
#
#
# array1 = [
#           ["a", "b", "c", "d", ...],
#           ["a", "b", "c", "d", ...],
#           ["a", "d", ...]...
#   ]
#
# data_structure = {a: 9/84, b:3/84, c:7, } #complicated to deduct
#
# data_structure = {a: 9, b:3, c:7, } #not weighted by probability
#
#
#
#
#
# hash * key


