require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_reader'

class NightReaderTest < Minitest::Test
  def test_night_reader_instantiates
    nightreader = NightReader.new
    assert_instance_of NightReader, nightreader
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

  def test_big_braille_bottom_maker_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_bottom_maker.class
  end

  def test_big_braille_bottom_maker_returns_nested_array_containing_every_third_line
    #does it know to insert line break last char?
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
    nightreader = NightReader.new("0.\n")
    top = nightreader.big_braille_top_maker
    assert_equal [["0", "."]], nightreader.big_braille_top_popper(top)
  end

  def test_big_braille_top_popper_returns_array_without_popped_elements_for_multiple
    nightreader = NightReader.new("0.\n..\n..\n")
    top = nightreader.big_braille_top_maker
    assert_equal [["0", "."]], nightreader.big_braille_top_popper(top)
  end

  def test_big_braille_top_popper_returns_empty_array
    nightreader = NightReader.new
    top = nightreader.big_braille_top_maker
    assert_equal [], nightreader.big_braille_top_popper(top)
  end

  def test_big_braille_middle_popper_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_middle_popper.class
  end

  def test_big_braille_middle_popper_returns_array_without_popped_element
    nightreader = NightReader.new("0.\n..\n..\n")
    middle = nightreader.big_braille_middle_maker
    assert_equal [[".", "."]], nightreader.big_braille_middle_popper(middle)
  end

  def test_big_braille_middle_popper_returns_array_without_popped_elements_for_multiple
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    middle = nightreader.big_braille_middle_maker
    assert_equal [[".", "."], [".", "."]], nightreader.big_braille_middle_popper(middle)
  end

  def test_big_braille_middle_popper_returns_empty_array
    nightreader = NightReader.new
    middle = nightreader.big_braille_middle_maker
    assert_equal [], nightreader.big_braille_middle_popper(middle)
  end

  def test_big_braille_bottom_popper_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_bottom_popper.class
  end

  def test_big_braille_bottom_popper_returns_array_without_popped_element
    nightreader = NightReader.new("0.\n..\n..\n")
    bottom = nightreader.big_braille_bottom_maker
    assert_equal [[".", "."]], nightreader.big_braille_bottom_popper(bottom)
  end

  def test_big_braille_bottom_popper_returns_array_without_popped_elements_for_multiple
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    bottom = nightreader.big_braille_bottom_maker
    assert_equal [[".", "."], [".", "."]], nightreader.big_braille_bottom_popper(bottom)
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
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    top = nightreader.big_braille_top_maker
    top_pop = nightreader.big_braille_top_popper(top)
    assert_equal ["0", ".", ".", "0"], nightreader.big_braille_top_flattener(top_pop)
  end

  def test_big_braille_top_flattener_returns_empty_array
    nightreader = NightReader.new
    top = nightreader.big_braille_top_maker
    top_pop = nightreader.big_braille_top_popper(top)
    assert_equal [], nightreader.big_braille_top_flattener(top_pop)
  end

  def test_big_braille_middle_flattener_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_middle_flattener.class
  end

  def test_big_braille_middle_flattener_returns_flattened_array
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    middle = nightreader.big_braille_middle_maker
    middle_pop = nightreader.big_braille_middle_popper(middle)
    assert_equal [".", ".", ".", "."], nightreader.big_braille_middle_flattener(middle_pop)
  end

  def test_big_braille_middle_flattener_returns_empty_array
    nightreader = NightReader.new
    middle = nightreader.big_braille_middle_maker
    middle_pop = nightreader.big_braille_middle_popper(middle)
    assert_equal [], nightreader.big_braille_middle_flattener(middle_pop)
  end

  def test_big_braille_bottom_flattener_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_bottom_flattener.class
  end

  def test_big_braille_bottom_flattener_returns_flattened_array
    nightreader = NightReader.new
    assert_equal ["a", "b", "c"], nightreader.big_braille_bottom_flattener([["a", "b"], ["c"]])
  end

  def test_big_braille_bottom_flattener_returns_empty_array
    nightreader = NightReader.new
    bottom = nightreader.big_braille_bottom_maker
    bottom_pop = nightreader.big_braille_bottom_popper(bottom)
    assert_equal [], nightreader.big_braille_bottom_flattener(bottom_pop)
  end

  def test_big_braille_top_caller_returns_array
    nightreader = NightReader.new
    assert_equal Array, nightreader.big_braille_top_caller.class
  end

  def test_big_braille_top_caller_returns_flattened_array
    nightreader = NightReader.new("0.\n..\n..\n.0\n..\n..\n")
    assert_equal ["0", ".", ".", "0"], nightreader.big_braille_top_caller
  end

  def test_big_braille_top_caller_returns_empty_array
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

  def test_big_braille_middle_caller_returns_empty_array
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

  def test_big_braille_bottom_caller_returns_empty_array
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

   def test_total_braille_maker_

   end

end
