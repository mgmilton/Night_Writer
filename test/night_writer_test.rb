require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  def test_night_writer_instantiates
  nightwriter = NightWriter.new
  assert_instance_of NightWriter, nightwriter
  end

  def test_capitalized_checker_returns_capshift_lowercase_letter
    nightwriter = NightWriter.new("A")
    assert_equal ["CapShift", "a"], nightwriter.capitalized_checker
  end

  def test_capitalized_checker_returns_special_character
    nightwriter = NightWriter.new("!")
    assert_equal ["!"], nightwriter.capitalized_checker
  end

  def test_capitalized_checker_stores_certain_special_characters_without_capshift
    nightwriter = NightWriter.new("&")
    assert_equal ["&"], nightwriter.capitalized_checker
  end

  def test_english_to_braille_translator_replaces_english_with_braille
    nightwriter = NightWriter.new("a")
    assert_equal ["0....."], nightwriter.english_to_braille_translator
  end

  def test_english_to_braille_translator_returns_nil_when_character_absent_from_brailledictionary
    nightwriter = NightWriter.new("&")
    assert_equal [nil], nightwriter.english_to_braille_translator
  end

  def test_english_to_braille_translator_works_for_specialcharacters
    nightwriter = NightWriter.new("!")
    assert_equal ["..000."], nightwriter.english_to_braille_translator
  end

  def test_english_to_braille_translator_works_for_capitals
    nightwriter = NightWriter.new("A")
    assert_equal [".....0", "0....."], nightwriter.english_to_braille_translator
  end

  def test_braille_array_compactor_removes_nils
    nightwriter = NightWriter.new("&")
    assert_equal [], nightwriter.braille_array_compactor
  end

  def test_braille_array_compactor_removes_nils_keeps_other_characters
    nightwriter = NightWriter.new("&ab")
    assert_equal 2, nightwriter.braille_array_compactor.length
  end

  def test_braille_string_generator_returns_string
    nightwriter = NightWriter.new("A")
    assert_equal String, nightwriter.braille_string_generator.class
  end

  def test_braille_string_generator_returns_empty_string_with_no_argument
    nightwriter = NightWriter.new
    assert_equal "", nightwriter.braille_string_generator
  end

  def test_braille_string_generator_returns_string_of_sixfold_longer
    nightwriter = NightWriter.new("abc")
    assert_equal nightwriter.braille_string_generator.length, nightwriter.braille_array_compactor.length * 6
  end

  def test_string_splitter_by_two_returns_array
    nightwriter = NightWriter.new("ellen")
    assert_equal Array, nightwriter.string_splitter_by_two.class
  end

  def test_string_splitter_by_two_returns_array_of_braille_by_two
    nightwriter = NightWriter.new("a")
    assert_equal "0.", nightwriter.string_splitter_by_two[0]
  end

  def test_string_splitter_by_two_returns_array_of_half_length
    nightwriter = NightWriter.new("abc")
    assert_equal nightwriter.string_splitter_by_two.length * 2, nightwriter.braille_string_generator.length
  end

  def test_braille_top_maker_returns_an_array
    nightwriter = NightWriter.new("a")
    assert_equal Array, nightwriter.braille_top_maker.class
  end

  def test_braille_top_maker_returns_array_of_equal_length
    nightwriter = NightWriter.new("a")
    assert_equal 1, nightwriter.braille_top_maker.count
    nightwriter = NightWriter.new("abc")
    assert_equal 3, nightwriter.braille_top_maker.count
  end

  def test_braille_top_maker_returns_empty_array_with_empty_string
    nightwriter = NightWriter.new
    assert_equal [], nightwriter.braille_top_maker
  end

  def test_braille_middle_maker_returns_an_array
    nightwriter = NightWriter.new("a")
    assert_equal Array, nightwriter.braille_middle_maker.class
  end

  def test_braille_middle_maker_returns_array_of_equal_length
    nightwriter = NightWriter.new("a")
    assert_equal 1, nightwriter.braille_middle_maker.count
    nightwriter = NightWriter.new("abc")
    assert_equal 3, nightwriter.braille_middle_maker.count
  end

  def test_braille_middle_maker_returns_empty_array_with_empty_string
    nightwriter = NightWriter.new
    assert_equal [], nightwriter.braille_middle_maker
  end

  def test_braille_bottom_maker_returns_an_array
    nightwriter = NightWriter.new("a")
    assert_equal Array, nightwriter.braille_bottom_maker.class
  end

  def test_braille_bottom_maker_returns_array_of_equal_length
    nightwriter = NightWriter.new("a")
    assert_equal 1, nightwriter.braille_bottom_maker.count
    nightwriter = NightWriter.new("abc")
    assert_equal 3, nightwriter.braille_bottom_maker.count
  end

  def test_braille_bottom_maker_returns_empty_array_with_empty_string
    nightwriter = NightWriter.new
    assert_equal [], nightwriter.braille_bottom_maker
  end

  def test_big_braille_top_maker_returns_nest_array_of_max_forty
    nightwriter = NightWriter.new("a")
    assert_equal 1, nightwriter.big_braille_top_maker(["a"]).count
    nightwriter = NightWriter.new("abc")
    assert_equal 7, nightwriter.big_braille_top_maker([*1..256]).count
  end

  def test_big_braille_top_maker_returns_empty_array_with_empty_string
    nightwriter = NightWriter.new
    assert_equal [], nightwriter.big_braille_top_maker
  end

  def test_big_braille_top_maker_returns_error_if_input_not_array
    nightwriter = NightWriter.new
    assert_raises ArgumentError do
      nightwriter.big_braille_top_maker(9)
    end
    assert_raises ArgumentError do
      nightwriter.big_braille_top_maker("ellen")
    end
  end

  def test_big_braille_middle_maker_returns_nest_array_of_max_forty
    nightwriter = NightWriter.new("a")
    assert_equal 1, nightwriter.big_braille_middle_maker(["a"]).count
    nightwriter = NightWriter.new("abc")
    assert_equal 7, nightwriter.big_braille_middle_maker([*1..256]).count
  end

  def test_big_braille_middle_maker_returns_empty_array_with_empty_string
    nightwriter = NightWriter.new
    assert_equal [], nightwriter.big_braille_middle_maker
  end

  def test_big_braille_middle_maker_returns_error_if_input_not_array
    nightwriter = NightWriter.new
    assert_raises ArgumentError do
      nightwriter.big_braille_middle_maker(9)
    end
    assert_raises ArgumentError do
      nightwriter.big_braille_middle_maker("ellen")
    end
  end

  def test_big_braille_bottom_maker_returns_nest_array_of_max_forty
    nightwriter = NightWriter.new("a")
    assert_equal 1, nightwriter.big_braille_bottom_maker(["a"]).count
    nightwriter = NightWriter.new("abc")
    assert_equal 7, nightwriter.big_braille_bottom_maker([*1..256]).count
  end

  def test_big_braille_bottom_maker_returns_empty_array_with_empty_string
    nightwriter = NightWriter.new
    assert_equal [], nightwriter.big_braille_bottom_maker
  end

  def test_big_braille_bottom_maker_returns_error_if_input_not_array
    nightwriter = NightWriter.new
    assert_raises ArgumentError do
      nightwriter.big_braille_bottom_maker(9)
    end
    assert_raises ArgumentError do
      nightwriter.big_braille_bottom_maker("ellen")
    end
  end


  def test_big_braille_combiner_returns_an_array
    nightwriter = NightWriter.new
    assert_equal Array, nightwriter.big_braille_combiner.class
  end

  def test_big_braille_combiner_returns_nested_array
    skip
    nightwriter = NightWriter.new("abc")
    assert_equal Array, nightwriter.big_braille_combiner[0].class
  end





end
