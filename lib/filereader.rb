# require 'pry-state'

class FileReader

  def read_file
    english = File.open(ARGV[0], "r")
    incoming_text = english.read
    english.close
    incoming_text
  end

  def manipulation
    times_3 = read_file * 3
  end

  def write_file
    writer = File.open(ARGV[1], "w")
    characters = File.write(ARGV[1], manipulation)
    writer.close
    characters
  end

  def puts_statement
    puts "Created #{ARGV[1]} containing #{read_file.length} characters"
  end
end

k = FileReader.new
k.puts_statement
