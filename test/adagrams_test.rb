require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/adagrams'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Adagrams' do
  describe 'draw_letters method' do
    it 'draws ten letters from the letter pool' do
      drawn_letters = draw_letters
      expect(drawn_letters.size).must_equal 10
    end

    it 'returns an array, and each item is a single-letter string' do
      drawn_letters = draw_letters
      expect(drawn_letters.size).must_equal 10

      expect(drawn_letters).must_be_instance_of Array
      drawn_letters.each do |letter|
        expect(letter).must_be_instance_of String
        expect(letter.length).must_equal 1
      end
    end
  end

  describe 'uses_available_letters? method' do

    it 'returns true if the submitted letters are valid against the drawn letters' do
      drawn_letters = ['D', 'O', 'G', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
      test_word = 'DOG'

      is_valid = uses_available_letters? test_word, drawn_letters

      expect(is_valid).must_equal true
    end

    it 'returns false word contains letters not in the drawn letters' do
      drawn_letters = ['D', 'O', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
      test_word = 'DOG'

      is_valid = uses_available_letters? test_word, drawn_letters

      expect(is_valid).must_equal false
    end

    it 'returns false word contains repeated letters more than in the drawn letters' do
      drawn_letters = ['A', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X']
      test_word = 'AAA'

      is_valid = uses_available_letters? test_word, drawn_letters

      expect(is_valid).must_equal false
    end

    it 'does not change the letters in hand' do
      drawn_letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
      dl_copy = drawn_letters.dup

      # Hint: if your implementation of uses_available_letters?
      # needs to change the hand, you should make a copy first
      uses_available_letters? 'ABCD', drawn_letters

      expect(drawn_letters).must_equal dl_copy
    end

    it 'returns true if the submitted letters are valid against the drawn letters' do
      drawn_letters = ['K', 'Y', 'F', 'P', 'P', 'W', 'T', 'R', 'L', 'I']
      test_word = 'FLIP'

      is_valid = uses_available_letters? test_word, drawn_letters

      expect(is_valid).must_equal true
    end

    it 'returns false if the submitted letters are invalid against the drawn letters' do
      drawn_letters = ['K', 'Y', 'F', 'P', 'P', 'W', 'T', 'R', 'L', 'I']
      test_word = 'FLIX'

      is_valid = uses_available_letters? test_word, drawn_letters

      expect(is_valid).must_equal false
    end
  end

  describe 'score_word method' do
    it 'returns an accurate numerical score according to the score chart' do
      expect(score_word("A")).must_equal 1
      expect(score_word("DOG")).must_equal 5
      expect(score_word("WHIMSY")).must_equal 17
    end

    it 'returns a score regardless of input case' do
      expect(score_word("a")).must_equal 1
      expect(score_word("dog")).must_equal 5
      expect(score_word("wHiMsY")).must_equal 17
    end

    it 'returns a score of 0 if given an empty input' do
      expect(score_word("")).must_equal 0
    end

    it 'adds an extra 8 points if the word is 7 or more characters long' do
      expect(score_word("XXXXXXX")).must_equal 64
      expect(score_word("XXXXXXXX")).must_equal 72
      expect(score_word("XXXXXXXXX")).must_equal 80
    end
  end

  describe 'is_in_english_dict? method' do
    it 'returns true if word is in the English dictionary' do
      #arrange
      word = 'CAT'

      #act
      is_in_dict = is_in_english_dict?(word)

      #assert
      expect(is_in_dict).must_equal true
    end

    it 'returns false if word is not in the English dictionary' do
      #arrange
      word = 'XYZD'

      #act
      is_in_dict = is_in_english_dict?(word)

      #assert
      expect(is_in_dict).must_equal false
    end
  end
end
