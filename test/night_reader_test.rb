require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class NightReaderTest < Minitest::Test
  def test_night_reader_instantiates
    nightreader = NightReader.new
    assert_instance_of NightReader, nightreader
  end

  def test_big_braille_top_maker_raises_argument_when_passed_string
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.big_braille_top_maker("as")
    end
  end

  def test_big_braille_top_maker_raises_argument_when_passed_float
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.big_braille_top_maker(0.3)
    end
  end

  def test_big_braille_top_maker_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_top_maker.class
  end

  def test_big_braille_top_maker_returns_nested_array_containing_every_third_line
    nightreader = NightReader.new("0.\n..\n..")
    assert_equal [["0", ".", "\n"]], nightreader.big_braille_top_maker
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [["0", ".", "\n"], [".", "0", "\n"]], nightreader.big_braille_top_maker
  end

  def test_big_braille_top_maker_returns_empty_array
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_top_maker
  end

  def test_big_braille_middle_maker_raises_argument_when_passed_string
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.big_braille_middle_maker("as")
    end
  end

  def test_big_braille_top_maker_raises_argument_when_passed_float
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.big_braille_middle_maker(0.3)
    end
  end

  def test_big_braille_middle_maker_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_middle_maker.class
  end

  def test_big_braille_middle_maker_returns_nested_array_containing_every_third_line
    nightreader = NightReader.new("0.\n..\n..")
    assert_equal [[".", ".", "\n"]], nightreader.big_braille_middle_maker
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [[".", ".", "\n"], [".", ".", "\n"]], nightreader.big_braille_middle_maker
  end

  def test_big_braille_middle_maker_returns_empty_array
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_middle_maker
  end

  def test_big_braille_bottom_maker_raises_argument_when_passed_string
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.big_braille_bottom_maker("as")
    end
  end

  def test_big_braille_bottom_maker_raises_argument_when_passed_float
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.big_braille_bottom_maker(0.3)
    end
  end

  def test_big_braille_bottom_maker_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_bottom_maker.class
  end

  def test_big_braille_bottom_maker_returns_nested_array_containing_every_third_line
    nightreader = NightReader.new("0.\n..\n..\n")
    assert_equal [[".", ".", "\n"]], nightreader.big_braille_bottom_maker
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [[".", ".", "\n"], [".", ".", "\n"]], nightreader.big_braille_bottom_maker
  end

  def test_big_braille_bottom_maker_returns_empty_array
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_bottom_maker
  end

  def test_big_braille_top_popper_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_top_popper.class
  end

  def test_big_braille_top_popper_returns_array_without_popped_element
    nightreader = NightReader.new
    assert_equal [["0"]], nightreader.big_braille_top_popper([["0", "."]])
  end

  def test_big_braille_top_popper_returns_array_without_popped_elements_for_multiple_arrays
    nightreader = NightReader.new
    assert_equal [["0"], ["a"]], nightreader.big_braille_top_popper([["0", "."], ["a", "\n"]])
  end

  def test_big_braille_top_popper_returns_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_top_popper
  end

  def test_big_braille_middle_popper_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_middle_popper.class
  end

  def test_big_braille_middle_popper_returns_array_without_popped_element
    nightreader = NightReader.new
    assert_equal [["0"]], nightreader.big_braille_middle_popper([["0", "."]])
  end

  def test_big_braille_middle_popper_returns_array_without_popped_elements_for_multiple
    nightreader = NightReader.new
    assert_equal [["0"], ["a"]], nightreader.big_braille_middle_popper([["0", "."], ["a", "\n"]])
  end

  def test_big_braille_middle_popper_returns_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_middle_popper
  end

  def test_big_braille_bottom_popper_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_bottom_popper.class
  end

  def test_big_braille_bottom_popper_returns_array_without_popped_element
    nightreader = NightReader.new
    assert_equal [["0"]], nightreader.big_braille_bottom_popper([["0", "."]])
  end

  def test_big_braille_bottom_popper_returns_array_without_popped_elements_for_multiple
    nightreader = NightReader.new
    assert_equal [["0"], ["a"]], nightreader.big_braille_bottom_popper([["0", "."], ["a", "\n"]])
  end

  def test_big_braille_bottom_popper_returns_empty_array
    nightreader = NightReader.new
    bottom = nightreader.big_braille_bottom_maker
    assert_equal [], nightreader.big_braille_bottom_popper(bottom)
  end

  def test_big_braille_top_flattener_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_top_flattener.class
  end

  def test_big_braille_top_flattener_returns_flattened_array
    nightreader = NightReader.new
    assert_equal [1,2,3,4], nightreader.big_braille_top_flattener([[1,2],[3],[4]])
  end

  def test_big_braille_top_flattener_returns_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_top_flattener
  end

  def test_big_braille_middle_flattener_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_middle_flattener.class
  end

  def test_big_braille_middle_flattener_returns_flattened_array
    nightreader = NightReader.new
    assert_equal ["bernie", "hillary", "elizabeth", "joe", "mussolini"], nightreader.big_braille_middle_flattener([["bernie","hillary"], "elizabeth", ["joe"
      ], ["mussolini"]])
  end

  def test_big_braille_middle_flattener_returns_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_middle_flattener
  end

  def test_big_braille_bottom_flattener_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_bottom_flattener.class
  end

  def test_big_braille_bottom_flattener_returns_flattened_array
    nightreader = NightReader.new
    assert_equal ["a", "b", "c"], nightreader.big_braille_bottom_flattener([["a", "b"], ["c"]])
  end

  def test_big_braille_bottom_flattener_returns_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_bottom_flattener
  end

  def test_big_braille_top_caller_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_top_caller.class
  end

  def test_big_braille_top_caller_returns_flattened_array
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal ["0", ".", ".", "0"], nightreader.big_braille_top_caller
  end

  def test_big_braille_top_caller_returns_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_top_caller
  end

  def test_big_braille_middle_caller_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_middle_caller.class
  end

  def test_big_braille_middle_caller_returns_flattened_array
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [".", ".", ".", "."], nightreader.big_braille_middle_caller
  end

  def test_big_braille_middle_caller_returns_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_middle_caller
  end

  def test_big_braille_bottom_caller_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_bottom_caller.class
  end

  def test_big_braille_bottom_caller_returns_flattened_array
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [".", ".", ".", "."], nightreader.big_braille_bottom_caller
  end

  def test_big_braille_bottom_caller_returns_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.big_braille_bottom_caller
  end

  def test_total_braille_maker_returns_nil_when_passed_nothing
    nightreader = NightReader.new
    assert_nil nightreader.total_braille_maker
  end

  def test_total_braille_maker_returns_one_array
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n..")
    assert_equal ["0", ".", ".", ".", ".", ".", ".", "0", ".", ".", ".", ".", "."], nightreader.total_braille_maker
  end

  def test_total_braille_maker_eliminates_nils
    nightreader = NightReader.new
    assert_equal ["a", "b"], nightreader.total_braille_maker(0, ["a", "b", nil])
  end

  def test_total_braille_string_returns_a_string
    nightreader = NightReader.new("abc")
    assert_equal String, nightreader.total_braille_string.class
  end

  def test_total_braille_string_returns_a_string_of_equal_length
    nightreader = NightReader.new
    assert_equal 4, nightreader.total_braille_string(["a", "b", "c", "d"]).length
  end

  def test_total_braille_string_returns_a_joined_string
    nightreader = NightReader.new
    assert_equal "abcadfd", nightreader.total_braille_string(["abca", "dfd"])
  end

  def test_total_braille_by_six_returns_an_array_of_string_length_six
    nightreader = NightReader.new
    assert_equal ["abcdef"], nightreader.total_braille_by_six("abcdef")
  end

  def test_total_braille_by_six_returns_an_array_of_strings_length_six
    nightreader = NightReader.new
    assert_equal ["abcdef", "ghijkl"], nightreader.total_braille_by_six("abcdefghijkl")
  end

  def test_total_braille_by_six_returns_an_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.total_braille_by_six("abcdef").class
  end

  def test_total_braille_by_six_returns_an_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.total_braille_by_six
  end

  def test_braille_to_english_returns_an_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.braille_to_english
  end

  def test_braille_to_english_returns_an_english_array_when_passed_braille
    nightreader = NightReader.new
    assert_equal ["a"], nightreader.braille_to_english(["0....."], [])
  end

  def test_braille_to_english_raises_argument_when_passed_integers
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.braille_to_english(3, 3233)
    end
  end

  def test_braille_to_english_raises_argument_when_passed_strings
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.braille_to_english("s","3233")
    end
  end

  def test_capshift_finder_locates_all_indices_of_capshift_string
    nightreader = NightReader.new
    assert_equal [1,2], nightreader.capshift_finder(["a", "CapShift", "CapShift"])
  end

  def test_capshift_finder_returns_empty_array_when_capshift_is_absent
    nightreader = NightReader.new
    assert_equal [], nightreader.capshift_finder(["a", "b"])
  end

  def test_capshift_finder_returns_raises_argument_when_passed_integer
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.capshift_finder(8)
    end
  end

  def test_locations_plus_one_increases_numbers_in_an_array_by_one
    nightreader = NightReader.new
    assert_equal [1,3,4] , nightreader.locations_plus_one([0,2,3])
  end

  def test_locations_returns_empty_array_when_passed_nothing
    nightreader = NightReader.new
    assert_equal [], nightreader.locations_plus_one
  end

  def test_locations_plus_one_raises_argument_when_passed_integer
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.locations_plus_one(4)
    end
  end

  def test_capitalizer_returns_capitalized_values_at_indices_succeeding_capshift
    nightreader = NightReader.new
    assert_equal ["a", "CapShift", "C"], nightreader.capitalizer(["a", "CapShift", "c"], [2])
  end

  def test_capitalizer_returns_an_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.capitalizer(["abc"]).class
  end

  def test_capitalizer_returns_an_empty_array_when_passed_an_empty_array
    nightreader = NightReader.new
    assert_equal [], nightreader.capitalizer([])
  end

  def test_capshift_deleter_eliminates_capshifts_from_an_array
    nightreader = NightReader.new
    assert_equal ["a"], nightreader.capshift_deleter(["a", "CapShift"])
  end

  def test_capshift_deleter_returns_an_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.capshift_deleter.class
  end

  def test_capshift_deleter_returns_same_array_when_no_capshifts_present
    nightreader = NightReader.new
    assert_equal ["a", "b", "c"], nightreader.capshift_deleter(["a", "b", "c"])
  end

  def test_eng_array_to_string_raises_an_argument_when_passed_a_string
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.eng_array_to_string("as")
    end
  end

  def test_eng_array_to_string_raises_an_argument_when_passed_an_integer
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.eng_array_to_string(8)
    end
  end

  def test_eng_array_to_string_returns_a_string_of_equal_of_the_array_passed
    nightreader = NightReader.new
    assert_equal "abc", nightreader.eng_array_to_string(["abc"])
  end

  # def test_capshift_caller_returns_english_with_no_capshift
  #   nightreader = NightReader.new("0.\n..\n..\n")
  #   assert_equal "a", nightreader.capshift_caller
  # end

  def test_line_splitter_per_index_raises_argument_when_passed_string
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.line_splitter_per_index("as")
    end
  end

  def test_line_splitter_per_index_raises_argument_when_passed_float
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.line_splitter_per_index(0.3)
    end
  end

  def test_popper_deletes_last_element_of_array_and_returns_popped_element_in_array
    nightreader = NightReader.new
    assert_equal ["b", "c"], nightreader.popper([["a","b"], ["c"]])
  end

  def test_popper_raises_argument_when_passed_string
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.popper("as")
    end
  end

  def test_popper_raises_argument_when_passed_float
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.popper(0.3)
    end
  end

  def test_flatterner_reduces_dimensions_in_nested_array
    nightreader = NightReader.new
    assert_equal ["a","b","B"], nightreader.flattener([["a"], "b", "B"])
  end

  def test_flattener_raises_argument_when_passed_integer
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.flattener(3)
    end
  end

  def test_flattener_raises_argument_when_passed_string
    nightreader = NightReader.new
    assert_raises ArgumentError do
      nightreader.flattener("ssss")
    end
  end

end
