# frozen_string_literal: true

LETTER_POOL = [
  Array.new(1, 'A'),
  Array.new(2, 'B'),
  Array.new(2, 'C'),
  Array.new(4, 'D'),
  Array.new(12, 'E'),
  Array.new(2, 'F'),
  Array.new(3, 'G'),
  Array.new(2, 'H'),
  Array.new(9, 'I'),
  Array.new(1, 'J'),
  Array.new(1, 'K'),
  Array.new(4, 'L'),
  Array.new(2, 'M'),
  Array.new(6, 'N'),
  Array.new(8, 'O'),
  Array.new(2, 'P'),
  Array.new(1, 'Q'),
  Array.new(6, 'R'),
  Array.new(4, 'S'),
  Array.new(6, 'T'),
  Array.new(4, 'U'),
  Array.new(2, 'V'),
  Array.new(2, 'W'),
  Array.new(1, 'X'),
  Array.new(2, 'Y'),
  Array.new(1, 'Z'),
]

def pool_creation(letter_pool)
  letter_pool_to_draw_from = []
  letter_pool.each do |letters|
    letter_pool_to_draw_from = letter_pool_to_draw_from.concat(letters)
  end
  letter_pool_to_draw_from
end

def draw_letters
  letter_pool_to_draw_from = pool_creation(LETTER_POOL).shuffle
  letters_in_hand = letter_pool_to_draw_from.pop(10)
end

def display_welcome_message
  puts 'Welcome to Adagrams!'
  puts "Let's draw 10 letters from the letter pool..."
end

def display_drawn_letters(letters)
  puts 'You have drawn the letters:'
  puts draw_letters.join(', ')
end

display_welcome_message
display_drawn_letters(draw_letters)

def uses_available_letters?(word, letters_in_hand)
  letters_in_hand = letters_in_hand.clone
  word = word.split('')
  # Looping through word
  word.each do |char|
    # Remove char from hand
    result = letters_in_hand.delete(char) # return nil if can't delete
    return false if result == nil
  end
  return true
end


def score_word(word)
  word = word.upcase
  word = word.split('')
  value = 0

  word.each do |char|
    case char
    when ''
      value = 0
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'
      value += 1
    when 'D', 'G'
      value += 2
    when 'B', 'C', 'M', 'P'
      value += 3
    when 'F', 'H', 'V', 'W', 'Y'
      value += 4
    when 'K'
      value += 5
    when 'J','X'
      value += 8
    when 'Q', 'Z'
      value += 10
    end
  end

  puts value
  word_score = value
  word_score = value + 8 if word.length >= 7

  return word_score

  # find the score of a given word
  # each char has a value according to the score chart
  # compute the total point
  # accept input as incasesensitive (lower/upper)
  # return point
  # return 0 if input is empty
  # if word length is 7 or more, add 8 to  score

end

def highest_score_from(words)
  highest_score = 0

  words.each do |word|
    if score_word(word) > highest_score
      highest_score = score_word(word)
    end
  end

  # Find all words that tie for highest score
  highest_words = []
  words.each do |word|
    if score_word(word) == highest_score
      highest_words << word
    end
  end

  sorted_highest_words = highest_words.sort { |a, b| a.length <=> b.length }

  if sorted_highest_words.length > 1 && sorted_highest_words[0].length == sorted_highest_words[1].length
    return { word: sorted_highest_words[0], score: highest_score }
  end

  if sorted_highest_words[-1].length == 10
    return { word: sorted_highest_words[-1], score: highest_score }
  end

  return { word: sorted_highest_words[0], score: highest_score }
end

  # winner_word = ''
  # winner_word_point = 0
  # words.each do |word|
  #   score = score_word(word)
  #   # need to run score for value
  #   next unless score < winners[:score]
  #   p winners[:score]
  #   score = winners[:score]
  #   winner_word = winners[:word]
  # end


# remove character from hand
# if we couldn't remove it, then that means it's false
# if we can remove it, just keep going
# if we get to the end of the loop and haven't returned, that means all the letters in word were in letters in hand


# puts draw_letters

# {'A' => Array.new(1,'A')},
#     {'B' => Array.new(2,'B')},
#     {'C' => Array.new(2,'C')},
#     {'D' => Array.new(4,'D')},
#     {'E' => Array.new(12,'E')},
#     {'F' => Array.new(2,'F')},
#     {'G' => Array.new(3,'G')},
#     {'H' => Array.new(2,'H')},
#     {'I' => Array.new(9,'I')},
#     {'J' => Array.new(1,'J')},
#     {'K' => Array.new(1,'K')},
#     {'L' => Array.new(4,'L')},
#     {'M' => Array.new(2,'M')},
#     {'N' => Array.new(6,'N')},
#     {'O' => Array.new(8,'O')},
#     {'P' => Array.new(2,'P')},
#     {'Q' => Array.new(1,'Q')},
#     {'R' => Array.new(6,'R')},
#     {'S' => Array.new(4,'S')},
#     {'T' => Array.new(6,'T')},
#     {'U' => Array.new(4,'U')},
#     {'V' => Array.new(2,'V')},
#     {'W' => Array.new(2,'W')},
#     {'X' => Array.new(1,'X')},
#     {'Y' => Array.new(2,'Y')},
#     {'Z' => Array.new(1,'Z')}

# hand = shuffle.

# pool = ["a", "a", "a", "a", "a", "a", "a", "a", ]
# pick = random() % pool.length
# hand << pool[pick]
# pool.erase(pick)
#
# pool = {
#     'a' => 9,
#     'b' => 2
# }
#
# hand = {}
# total_letters = 98
# 10.times do
#   pick = rand()
# end
#
