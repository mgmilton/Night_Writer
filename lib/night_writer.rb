require './lib/english_to_braille'

class NightWriter

  def read_file
    english_file = File.open(ARGV[0], "r")
    incoming_text = english_file.read
    english_file.close
    incoming_text
  end

  def english_to_braille
    night_writer = EnglishToBraille.new(read_file)
    braille = night_writer.print
    braille
  end

  def write_file
    writer_file = File.open(ARGV[1], "w")
    new_content = writer_file.write(english_to_braille)
    writer_file.close
    new_content
  end

  def puts_statement
    puts "Created #{ARGV[1]} containing #{read_file.length} characters"
  end
end

k = NightWriter.new
k.write_file
k.puts_statement
