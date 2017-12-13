require './test/test_helper'
require './lib/english_to_braille'


class EnglishToBrailleTest < Minitest::Test
  def test_englishtobraille_instantiates
  english_to_braille = EnglishToBraille.new
  assert_instance_of EnglishToBraille, english_to_braille
  end

  def test_capitalized_checker_returns_capshift_lowercase_letter
    english_to_braille = EnglishToBraille.new("A")
    assert_equal ["CapShift", "a"], english_to_braille.capitalized_checker
  end

  def test_capitalized_checker_returns_special_character
    english_to_braille = EnglishToBraille.new("!")
    assert_equal ["!"], english_to_braille.capitalized_checker
  end

  def test_capitalized_checker_stores_certain_special_characters_without_capshift
    english_to_braille = EnglishToBraille.new("&")
    assert_equal ["&"], english_to_braille.capitalized_checker
  end

  def test_english_to_braille_translator_replaces_english_with_braille
    english_to_braille = EnglishToBraille.new("a")
    assert_equal ["0....."], english_to_braille.english_to_braille_translator
  end

  def test_english_to_braille_translator_returns_nil_when_character_absent_from_brailledictionary
    english_to_braille = EnglishToBraille.new("&")
    assert_equal [nil], english_to_braille.english_to_braille_translator
  end

  def test_english_to_braille_translator_works_for_specialcharacters
    english_to_braille = EnglishToBraille.new("!")
    assert_equal ["..000."], english_to_braille.english_to_braille_translator
  end

  def test_english_to_braille_translator_works_for_capitals
    english_to_braille = EnglishToBraille.new("A")
    assert_equal [".....0", "0....."], english_to_braille.english_to_braille_translator
  end

  def test_braille_array_compactor_removes_nils
    english_to_braille = EnglishToBraille.new("&")
    assert_equal [], english_to_braille.braille_array_compactor
  end

  def test_braille_array_compactor_removes_nils_keeps_other_characters
    english_to_braille = EnglishToBraille.new("&ab")
    assert_equal 2, english_to_braille.braille_array_compactor.length
  end

  def test_braille_string_generator_returns_string
    english_to_braille = EnglishToBraille.new("A")
    assert_equal String, english_to_braille.braille_string_generator.class
  end

  def test_braille_string_generator_returns_empty_string_with_no_argument
    english_to_braille = EnglishToBraille.new
    assert_equal "", english_to_braille.braille_string_generator
  end

  def test_braille_string_generator_returns_string_of_sixfold_longer
    english_to_braille = EnglishToBraille.new("abc")
    assert_equal english_to_braille.braille_string_generator.length, english_to_braille.braille_array_compactor.length * 6
  end

  def test_string_splitter_by_two_returns_array
    english_to_braille = EnglishToBraille.new("ellen")
    assert_equal Array, english_to_braille.string_splitter_by_two.class
  end

  def test_string_splitter_by_two_returns_array_of_braille_by_two
    english_to_braille = EnglishToBraille.new("a")
    assert_equal "0.", english_to_braille.string_splitter_by_two[0]
  end

  def test_string_splitter_by_two_returns_array_of_half_length
    english_to_braille = EnglishToBraille.new("abc")
    assert_equal english_to_braille.string_splitter_by_two.length * 2, english_to_braille.braille_string_generator.length
  end

  def test_braille_top_maker_returns_an_array
    english_to_braille = EnglishToBraille.new("a")
    assert_equal Array, english_to_braille.braille_top_maker.class
  end

  def test_braille_top_maker_returns_array_of_equal_length
    english_to_braille = EnglishToBraille.new("a")
    assert_equal 1, english_to_braille.braille_top_maker.count
    english_to_braille = EnglishToBraille.new("abc")
    assert_equal 3, english_to_braille.braille_top_maker.count
  end

  def test_braille_top_maker_returns_empty_array_with_empty_string
    english_to_braille = EnglishToBraille.new
    assert_equal [], english_to_braille.braille_top_maker
  end

  def test_braille_middle_maker_returns_an_array
    english_to_braille = EnglishToBraille.new("a")
    assert_equal Array, english_to_braille.braille_middle_maker.class
  end

  def test_braille_middle_maker_returns_array_of_equal_length
    english_to_braille = EnglishToBraille.new("a")
    assert_equal 1, english_to_braille.braille_middle_maker.count
    english_to_braille = EnglishToBraille.new("abc")
    assert_equal 3, english_to_braille.braille_middle_maker.count
  end

  def test_braille_middle_maker_returns_empty_array_with_empty_string
    english_to_braille = EnglishToBraille.new
    assert_equal [], english_to_braille.braille_middle_maker
  end

  def test_braille_bottom_maker_returns_an_array
    english_to_braille = EnglishToBraille.new("a")
    assert_equal Array, english_to_braille.braille_bottom_maker.class
  end

  def test_braille_bottom_maker_returns_array_of_equal_length
    english_to_braille = EnglishToBraille.new("a")
    assert_equal 1, english_to_braille.braille_bottom_maker.count
    english_to_braille = EnglishToBraille.new("abc")
    assert_equal 3, english_to_braille.braille_bottom_maker.count
  end

  def test_braille_bottom_maker_returns_empty_array_with_empty_string
    english_to_braille = EnglishToBraille.new
    assert_equal [], english_to_braille.braille_bottom_maker
  end

  def test_big_braille_top_maker_returns_nest_array_of_max_forty
    english_to_braille = EnglishToBraille.new("a")
    assert_equal 1, english_to_braille.big_braille_top_maker(["a"]).count
    english_to_braille = EnglishToBraille.new("abc")
    assert_equal 7, english_to_braille.big_braille_top_maker([*1..256]).count
  end

  def test_big_braille_top_maker_returns_empty_array_with_empty_string
    english_to_braille = EnglishToBraille.new
    assert_equal [], english_to_braille.big_braille_top_maker
  end

  def test_big_braille_top_maker_returns_error_if_input_not_array
    english_to_braille = EnglishToBraille.new
    assert_raises ArgumentError do
      english_to_braille.big_braille_top_maker(9)
    end
    assert_raises ArgumentError do
      english_to_braille.big_braille_top_maker("ellen")
    end
  end

  def test_big_braille_middle_maker_returns_nest_array_of_max_forty
    english_to_braille = EnglishToBraille.new("a")
    assert_equal 1, english_to_braille.big_braille_middle_maker(["a"]).count
    english_to_braille = EnglishToBraille.new("abc")
    assert_equal 7, english_to_braille.big_braille_middle_maker([*1..256]).count
  end

  def test_big_braille_middle_maker_returns_empty_array_with_empty_string
    english_to_braille = EnglishToBraille.new
    assert_equal [], english_to_braille.big_braille_middle_maker
  end

  def test_big_braille_middle_maker_returns_error_if_input_not_array
    english_to_braille = EnglishToBraille.new
    assert_raises ArgumentError do
      english_to_braille.big_braille_middle_maker(9)
    end
    assert_raises ArgumentError do
      english_to_braille.big_braille_middle_maker("ellen")
    end
  end

  def test_big_braille_bottom_maker_returns_nest_array_of_max_forty
    english_to_braille = EnglishToBraille.new("a")
    assert_equal 1, english_to_braille.big_braille_bottom_maker(["a"]).count
    english_to_braille = EnglishToBraille.new("abc")
    assert_equal 7, english_to_braille.big_braille_bottom_maker([*1..256]).count
  end

  def test_big_braille_bottom_maker_returns_empty_array_with_empty_string
    english_to_braille = EnglishToBraille.new
    assert_equal [], english_to_braille.big_braille_bottom_maker
  end

  def test_big_braille_bottom_maker_returns_error_if_input_not_array
    english_to_braille = EnglishToBraille.new
    assert_raises ArgumentError do
      english_to_braille.big_braille_bottom_maker(9)
    end
    assert_raises ArgumentError do
      english_to_braille.big_braille_bottom_maker("ellen")
    end
  end

  def test_big_braille_combiner_returns_an_array
    english_to_braille = EnglishToBraille.new
    assert_equal Array, english_to_braille.big_braille_combiner.class
  end

  def test_big_braille_caller_returns_an_array
    english_to_braille = EnglishToBraille.new
    assert_equal Array, english_to_braille.big_braille_caller.class
  end

  def test_index_checker_raises_argument_when_passed_string
    english_to_braille = EnglishToBraille.new
    assert_raises ArgumentError do
      english_to_braille.index_checker("as")
    end
  end

  def test_index_checker_raises_argument_when_passed_integer
    english_to_braille = EnglishToBraille.new
    assert_raises ArgumentError do
      english_to_braille.index_checker(0)
    end
  end

end
