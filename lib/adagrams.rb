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