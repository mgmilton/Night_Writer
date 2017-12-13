require './test/test_helper'
require './lib/night_writer'

class NightWriterTest < Minitest::Test

  def test_night_writer_instantiates
    nightreader = NightWriter.new
    assert_instance_of NightWriter, nightreader
  end

end
