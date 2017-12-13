require './test/test_helper'
require './lib/braille_to_english'

class BrailleToEnglishTest < Minitest::Test
  def test_braille_to_english_instantiates
    braille_to_english = BrailleToEnglish.new
    assert_instance_of BrailleToEnglish, braille_to_english
  end

  def test_big_braille_top_maker_raises_argument_when_passed_string
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.big_braille_top_maker("as")
    end
  end

  def test_big_braille_top_maker_raises_argument_when_passed_float
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.big_braille_top_maker(0.3)
    end
  end

  def test_big_braille_top_maker_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_top_maker.class
  end

  def test_big_braille_top_maker_returns_nested_array_containing_every_third_line
    braille_to_english = BrailleToEnglish.new("0.\n..\n..")
    assert_equal [["0", ".", "\n"]], braille_to_english.big_braille_top_maker
    braille_to_english = BrailleToEnglish.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [["0", ".", "\n"], [".", "0", "\n"]], braille_to_english.big_braille_top_maker
  end

  def test_big_braille_top_maker_returns_empty_array
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_top_maker
  end

  def test_big_braille_middle_maker_raises_argument_when_passed_string
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.big_braille_middle_maker("as")
    end
  end

  def test_big_braille_top_maker_raises_argument_when_passed_float
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.big_braille_middle_maker(0.3)
    end
  end

  def test_big_braille_middle_maker_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_middle_maker.class
  end

  def test_big_braille_middle_maker_returns_nested_array_containing_every_third_line
    braille_to_english = BrailleToEnglish.new("0.\n..\n..")
    assert_equal [[".", ".", "\n"]], braille_to_english.big_braille_middle_maker
    braille_to_english = BrailleToEnglish.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [[".", ".", "\n"], [".", ".", "\n"]], braille_to_english.big_braille_middle_maker
  end

  def test_big_braille_middle_maker_returns_empty_array
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_middle_maker
  end

  def test_big_braille_bottom_maker_raises_argument_when_passed_string
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.big_braille_bottom_maker("as")
    end
  end

  def test_big_braille_bottom_maker_raises_argument_when_passed_float
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.big_braille_bottom_maker(0.3)
    end
  end

  def test_big_braille_bottom_maker_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_bottom_maker.class
  end

  def test_big_braille_bottom_maker_returns_nested_array_containing_every_third_line
    braille_to_english = BrailleToEnglish.new("0.\n..\n..\n")
    assert_equal [[".", ".", "\n"]], braille_to_english.big_braille_bottom_maker
    braille_to_english = BrailleToEnglish.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [[".", ".", "\n"], [".", ".", "\n"]], braille_to_english.big_braille_bottom_maker
  end

  def test_big_braille_bottom_maker_returns_empty_array
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_bottom_maker
  end

  def test_big_braille_top_popper_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_top_popper.class
  end

  def test_big_braille_top_popper_returns_array_without_popped_element
    braille_to_english = BrailleToEnglish.new
    assert_equal [["0"]], braille_to_english.big_braille_top_popper([["0", "."]])
  end

  def test_big_braille_top_popper_returns_array_without_popped_elements_for_multiple_arrays
    braille_to_english = BrailleToEnglish.new
    assert_equal [["0"], ["a"]], braille_to_english.big_braille_top_popper([["0", "."], ["a", "\n"]])
  end

  def test_big_braille_top_popper_returns_empty_array_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_top_popper
  end

  def test_big_braille_middle_popper_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_middle_popper.class
  end

  def test_big_braille_middle_popper_returns_array_without_popped_element
    braille_to_english = BrailleToEnglish.new
    assert_equal [["0"]], braille_to_english.big_braille_middle_popper([["0", "."]])
  end

  def test_big_braille_middle_popper_returns_array_without_popped_elements_for_multiple
    braille_to_english = BrailleToEnglish.new
    assert_equal [["0"], ["a"]], braille_to_english.big_braille_middle_popper([["0", "."], ["a", "\n"]])
  end

  def test_big_braille_middle_popper_returns_empty_array_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_middle_popper
  end

  def test_big_braille_bottom_popper_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_bottom_popper.class
  end

  def test_big_braille_bottom_popper_returns_array_without_popped_element
    braille_to_english = BrailleToEnglish.new
    assert_equal [["0"]], braille_to_english.big_braille_bottom_popper([["0", "."]])
  end

  def test_big_braille_bottom_popper_returns_array_without_popped_elements_for_multiple
    braille_to_english = BrailleToEnglish.new
    assert_equal [["0"], ["a"]], braille_to_english.big_braille_bottom_popper([["0", "."], ["a", "\n"]])
  end

  def test_big_braille_bottom_popper_returns_empty_array
    braille_to_english = BrailleToEnglish.new
    bottom = braille_to_english.big_braille_bottom_maker
    assert_equal [], braille_to_english.big_braille_bottom_popper(bottom)
  end

  def test_big_braille_top_flattener_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_top_flattener.class
  end

  def test_big_braille_top_flattener_returns_flattened_array
    braille_to_english = BrailleToEnglish.new
    assert_equal [1,2,3,4], braille_to_english.big_braille_top_flattener([[1,2],[3],[4]])
  end

  def test_big_braille_top_flattener_returns_empty_array_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_top_flattener
  end

  def test_big_braille_middle_flattener_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_middle_flattener.class
  end

  def test_big_braille_middle_flattener_returns_flattened_array
    braille_to_english = BrailleToEnglish.new
    assert_equal ["bernie", "hillary", "elizabeth", "joe", "mussolini"], braille_to_english.big_braille_middle_flattener([["bernie","hillary"], "elizabeth", ["joe"
      ], ["mussolini"]])
  end

  def test_big_braille_middle_flattener_returns_empty_array_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_middle_flattener
  end

  def test_big_braille_bottom_flattener_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_bottom_flattener.class
  end

  def test_big_braille_bottom_flattener_returns_flattened_array
    braille_to_english = BrailleToEnglish.new
    assert_equal ["a", "b", "c"], braille_to_english.big_braille_bottom_flattener([["a", "b"], ["c"]])
  end

  def test_big_braille_bottom_flattener_returns_empty_array_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_bottom_flattener
  end

  def test_big_braille_top_caller_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_top_caller.class
  end

  def test_big_braille_top_caller_returns_flattened_array
    braille_to_english = BrailleToEnglish.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal ["0", ".", ".", "0"], braille_to_english.big_braille_top_caller
  end

  def test_big_braille_top_caller_returns_empty_array_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_top_caller
  end

  def test_big_braille_middle_caller_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_middle_caller.class
  end

  def test_big_braille_middle_caller_returns_flattened_array
    braille_to_english = BrailleToEnglish.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [".", ".", ".", "."], braille_to_english.big_braille_middle_caller
  end

  def test_big_braille_middle_caller_returns_empty_array_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_middle_caller
  end

  def test_big_braille_bottom_caller_returns_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.big_braille_bottom_caller.class
  end

  def test_big_braille_bottom_caller_returns_flattened_array
    braille_to_english = BrailleToEnglish.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal [".", ".", ".", "."], braille_to_english.big_braille_bottom_caller
  end

  def test_big_braille_bottom_caller_returns_empty_array_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.big_braille_bottom_caller
  end

  def test_total_braille_maker_returns_nil_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_nil braille_to_english.total_braille_maker
  end

  def test_total_braille_maker_returns_one_array
    braille_to_english = BrailleToEnglish.new("0.\n..\n..\n.0\n..\n..\n..")
    assert_equal ["0", ".", ".", ".", ".", ".", ".", "0", ".", ".", ".", ".", "."], braille_to_english.total_braille_maker
  end

  def test_total_braille_maker_eliminates_nils
    braille_to_english = BrailleToEnglish.new
    assert_equal ["a", "b"], braille_to_english.total_braille_maker(0, ["a", "b", nil])
  end

  def test_total_braille_string_returns_a_string
    braille_to_english = BrailleToEnglish.new("abc")
    assert_equal String, braille_to_english.total_braille_string.class
  end


  def test_braille_to_english_raises_argument_when_passed_integers
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.braille_to_english(3, 3233)
    end
  end

  def test_braille_to_english_raises_argument_when_passed_strings
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.braille_to_english("s","3233")
    end
  end

  def test_capshift_finder_locates_all_indices_of_capshift_string
    braille_to_english = BrailleToEnglish.new
    assert_equal [1,2], braille_to_english.capshift_finder(["a", "CapShift", "CapShift"])
  end

  def test_capshift_finder_returns_empty_array_when_capshift_is_absent
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.capshift_finder(["a", "b"])
  end

  def test_capshift_finder_returns_raises_argument_when_passed_integer
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.capshift_finder(8)
    end
  end

  def test_locations_plus_one_increases_numbers_in_an_array_by_one
    braille_to_english = BrailleToEnglish.new
    assert_equal [1,3,4] , braille_to_english.locations_plus_one([0,2,3])
  end

  def test_locations_returns_empty_array_when_passed_nothing
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.locations_plus_one
  end

  def test_locations_plus_one_raises_argument_when_passed_integer
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.locations_plus_one(4)
    end
  end

  def test_capitalizer_returns_capitalized_values_at_indices_succeeding_capshift
    braille_to_english = BrailleToEnglish.new
    assert_equal ["a", "CapShift", "C"], braille_to_english.capitalizer(["a", "CapShift", "c"], [2])
  end

  def test_capitalizer_returns_an_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.capitalizer(["abc"]).class
  end

  def test_capitalizer_returns_an_empty_array_when_passed_an_empty_array
    braille_to_english = BrailleToEnglish.new
    assert_equal [], braille_to_english.capitalizer([])
  end

  def test_capshift_deleter_eliminates_capshifts_from_an_array
    braille_to_english = BrailleToEnglish.new
    assert_equal ["a"], braille_to_english.capshift_deleter(["a", "CapShift"])
  end

  def test_capshift_deleter_returns_an_array
    braille_to_english = BrailleToEnglish.new
    assert_equal Array, braille_to_english.capshift_deleter.class
  end

  def test_capshift_deleter_returns_same_array_when_no_capshifts_present
    braille_to_english = BrailleToEnglish.new
    assert_equal ["a", "b", "c"], braille_to_english.capshift_deleter(["a", "b", "c"])
  end

  def test_eng_array_to_string_raises_an_argument_when_passed_a_string
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.eng_array_to_string("as")
    end
  end

  def test_eng_array_to_string_raises_an_argument_when_passed_an_integer
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.eng_array_to_string(8)
    end
  end

  def test_eng_array_to_string_returns_a_string_of_equal_of_the_array_passed
    braille_to_english = BrailleToEnglish.new
    assert_equal "abc", braille_to_english.eng_array_to_string(["abc"])
  end

  def test_capshift_caller_returns_string
    braille_to_english = BrailleToEnglish.new("0.....")
    assert_equal String, braille_to_english.capshift_caller.class
  end

  def test_line_splitter_per_index_raises_argument_when_passed_string
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.line_splitter_per_index("as")
    end
  end

  def test_line_splitter_per_index_raises_argument_when_passed_float
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.line_splitter_per_index(0.3)
    end
  end

  def test_popper_deletes_last_element_of_array_and_returns_popped_element_in_array
    braille_to_english = BrailleToEnglish.new
    assert_equal ["b", "c"], braille_to_english.popper([["a","b"], ["c"]])
  end

  def test_popper_raises_argument_when_passed_string
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.popper("as")
    end
  end

  def test_popper_raises_argument_when_passed_float
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.popper(0.3)
    end
  end

  def test_flatterner_reduces_dimensions_in_nested_array
    braille_to_english = BrailleToEnglish.new
    assert_equal ["a","b","B"], braille_to_english.flattener([["a"], "b", "B"])
  end

  def test_flattener_raises_argument_when_passed_integer
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.flattener(3)
    end
  end

  def test_flattener_raises_argument_when_passed_string
    braille_to_english = BrailleToEnglish.new
    assert_raises ArgumentError do
      braille_to_english.flattener("ssss")
    end
  end

end
