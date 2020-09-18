require 'csv'


def draw_letters
  hand = Array.new(10)

  letter_pool = [
      {letter: "A", count: 9},
      {letter: "B", count: 2},
      {letter: "C", count: 2},
      {letter: "D", count: 4},
      {letter: "E", count: 12},
      {letter: "F", count: 2},
      {letter: "G", count: 3},
      {letter: "H", count: 2},
      {letter: "I", count: 9},
      {letter: "J", count: 1},
      {letter: "K", count: 1},
      {letter: "L", count: 4},
      {letter: "M", count: 2},
      {letter: "N", count: 6},
      {letter: "O", count: 8},
      {letter: "P", count: 2},
      {letter: "Q", count: 1},
      {letter: "R", count: 6},
      {letter: "S", count: 4},
      {letter: "T", count: 6},
      {letter: "U", count: 4},
      {letter: "V", count: 2},
      {letter: "W", count: 2},
      {letter: "X", count: 1},
      {letter: "Y", count: 2},
      {letter: "Z", count: 1}
  ]

  hand.each_index do |i|
    letter_index = rand(0...letter_pool.length)

    while letter_pool[letter_index][:count] == 0
      letter_index = rand(0...letter_pool.length)
    end

    hand[i] = letter_pool[letter_index][:letter]
    letter_pool[letter_index][:count] -= 1
  end

  return hand
end

def uses_available_letters?(input, letters_in_hand)

  # create a hash where each letter is the key and the number of letters is the value.
  # take the intersection_with dupes, turn into a hash of letters and counts
  # Take input_array, turn into hash of letters and counts
  # if the length two hashes is the same ()all letters match) compare the letter count between letters
  # if INput_hash letter count is more, return false

  raise ArgumentError.new("input is nil") if input.nil?
  raise ArgumentError.new("input is nil") if letters_in_hand.nil?
  result = ''
  # input.length.times do |index|
  #   if letters_in_hand.include?input[index]
  #     if letters_in_hand.select { |letter| letter == input[index] }.count == input[index].count
  #       result = true
  #     else
  #      result = false
  #   end
  # end

  #return result

  input_array = input.upcase.split("").sort
  intersection_with_dupes = (letters_in_hand - (letters_in_hand - (input_array & letters_in_hand)))
  input_letter_count = {}
  inter_letter_count = {}
  input_array.each do |letter|
    input_letter_count[letter.to_sym] = input_array.count(letter)
  end

  intersection_with_dupes.each do |letter|
    inter_letter_count[letter.to_sym] = intersection_with_dupes.count(letter)
  end

  uses_available = true
  if(input_letter_count.length == inter_letter_count.length)
    input_letter_count.each do |letter, count|
      uses_available = uses_available && count <= inter_letter_count[letter]
    end
  else
    uses_available = false
  end

  # #variable contains intersection, but retains duplicate letters

  #
  # #remove all the letters that aren't in input
  # return input_array == intersection_with_dupes
  return uses_available
end

def score_word(word)

  raise ArgumentError.new("words is nil") if word.nil?

  total_score = 0

  word.upcase.each_char do |letter|
    case letter
    when 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'
      total_score += 1
    when 'D', 'G'
      total_score += 2
    when 'B', 'C', 'M', 'P'
      total_score += 3
    when 'F', 'H', 'V', 'W', 'Y'
      total_score += 4
    when 'K'
      total_score += 5
    when 'J', 'X'
      total_score += 8
    when 'Q', 'Z'
      total_score += 10
    end
  end

  total_score += 8 if word.length > 6 && word.length <= 10

  return total_score
end

def highest_score_from(words)

  raise ArgumentError.new("words is nil") if words.nil?

  highest_score = score_word(words.max_by{|word| score_word(word)})

  ties = words.select{ |word| score_word(word) == highest_score}

  ties_minmax = ties.minmax_by{|word| word.length}

  winning_word = ties_minmax[1].length == 10 ? ties_minmax[1] : ties_minmax[0]

  return {word: winning_word, score: score_word(winning_word)}

end

def is_in_english_dict?(input)

  raise ArgumentError.new("words is nil") if input.nil?

  dictionary = CSV.read("./assets/dictionary-english.csv").flatten

  dict_hash = Hash.new { |hash, key| hash[key] = [] }

  dictionary.each do |word|
    dict_hash[word.downcase.chars.sort.join.to_sym] << word
  end

 return dict_hash[input.downcase.chars.sort.join.to_sym].include?(input.downcase)

end


p uses_available_letters?('HEN', %w(H N N N L E H K Y U))