
def draw_letters()
  hand = []

  letter_dist = {
      "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3,
      "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2,
      "N" => 6, "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6,
      "U" => 4, "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1
  }

  letter_pool = []

  letter_dist.each do |letter, times|
    letter_pool << Array.new(times) { letter }
  end

  letter_pool = letter_pool.flatten

  until hand.length == 10 do
    index = rand(letter_pool.length)

    hand << letter_pool[index]
    letter_pool.delete_at(index)
  end
  return hand
end

puts "#{draw_letters()}"
