# WAVE 1

def draw_letters
  letter_pool = %w(
  A A A A A A A A A
  B B
  C C
  D D D D
  E E E E E E E E E E E E
  F F
  G G G
  H H
  I I I I I I I I I
  J
  K
  L L L L
  M M
  N N N N N N
  O O O O O O O O
  P P
  Q
  R R R R R R
  S S S S
  T T T T T T
  U U U U
  V V
  W W
  X
  Y
  Z
)
  return letter_pool.sample(10)

end

# WAVE 2

def uses_available_letters?(input, letters_in_hand)

  new_letters_in_hand = letters_in_hand.dup

  input.upcase.chars.each do |character|
    if new_letters_in_hand.include?(character)
      position = new_letters_in_hand.index(character)
      new_letters_in_hand.delete_at(position)
    else
      return false
    end
  end
  return true
end