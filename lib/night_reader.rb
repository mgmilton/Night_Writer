require './lib/braille_to_english'

class NightReader

  def read_file
    braille_file = File.open(ARGV[0], "r")
    incoming_text = braille_file.read
    braille_file.close
    incoming_text
  end

  def braille_to_english
    night_reader = BrailleToEnglish.new(read_file)
    english = night_reader.capshift_caller
    english
  end

  def write_file
    writer_file = File.open(ARGV[1], "w")
    new_content = writer_file.write(braille_to_english)
    writer_file.close
    new_content
  end

  def puts_statement
    puts "Created #{ARGV[1]} containing #{write_file} characters"
  end
end


k = NightReader.new
k.write_file
k.puts_statement
