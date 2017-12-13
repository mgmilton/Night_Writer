require './test/test_helper'
require './lib/night_reader'

class NightReaderTest < Minitest::Test

  def test_nightreader_instantiates
    nightreader = NightReader.new
    assert_instance_of NightReader, nightreader
  end


end
#
