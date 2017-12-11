# TO DO
# Path ./lib/not working
# Learn about branches
class NightWriter

  def initialize
    @braille_top = []
    @braille_middle = []
    @braille_bottom = []
    @big_braille_top = []
    @big_braille_middle = []
    @big_braille_bottom = []
    @mama_braille = []
    @letters = File.readlines(ARGV[0], "r").join

  end

  BRAILLE_DICTIONARY ={
                  "a"=> "0.....",
                   "b"=>"0.0...",
                   "c"=>"00....",
                   "d"=>"00.0..",
                   "e"=>"0..0..",
                   "f"=>"000...",
                   "g"=>"0000..",
                   "h"=>"0.00..",
                   "i"=>".00...",
                   "j"=>".000..",
                   "k"=>"0...0.",
                   "l"=>"0.0.0.",
                   "m"=>"00..0.",
                   "n"=>"00.00.",
                   "o"=>"0..00.",
                   "p"=>"000.0.",
                   "q"=> "00000.",
                   "r"=>"0.000.",
                   "s"=>".00.0.",
                   "t"=>".0000.",
                   "u"=>"0...00",
                   "v"=>"0.0.00",
                   "w"=>".000.0",
                   "x"=>"00..00",
                   "y"=>"00.000",
                   "z"=>"0..000",
                   "CapShift"=>".....0",
                   " "=>"......",
                   "#"=>".0.000",
                   "!"=>"..000.",
                   "'"=>"....0.",
                   ","=>"..0...",
                   "-"=>"....00",
                   "?"=> "..0.00",
                   "."=>"..00.0"}

  def capitalized_checker
    special_chars = [" ", "#", "!", "'", ",","-", "?", "."]
    letters_array = @letters.split("")
    new_letters = []
    letters_array.each do |letter|
      if special_chars.include?(letter)
        new_letters << letter
      elsif letter == letter.upcase
        new_letters << "CapShift"
        new_letters << letter.downcase
      else
        new_letters << letter
      end
    end
    new_letters
  end


  def string_splitter
    braille_array = []
    capitalized_checker.each do |x|
      braille_array << BRAILLE_DICTIONARY[x]
    end
    braille_string = braille_array.join("")
    braille_array_by_two =  braille_string.scan(/.{2}/)
  end


  def braille_stacker
    string_splitter.each_with_index do |value, index|
      if index % 3 == 0
        @braille_top << value
      elsif (index-1) % 3 == 0
        @braille_middle << value
      elsif (index+1) % 3 == 0
        @braille_bottom << value
      end
    end
  end

  def braille_shifter
    braille_stacker
    until @braille_top.empty?
      @big_braille_top << @braille_top.shift(40)
    end
    until @braille_middle.empty?
      @big_braille_middle << @braille_middle.shift(40)
    end
    until @braille_bottom.empty?
      @big_braille_bottom << @braille_bottom.shift(40)
    end
  end

  def big_braille_combiner
    braille_shifter
    counter = 0
    mama_braille = []
    @big_braille_top.length.times do
      @mama_braille << @big_braille_top[counter]
      @mama_braille << @big_braille_middle[counter]
      @mama_braille << @big_braille_bottom[counter]
      counter +=1
    end
    @mama_braille
  end

  def print
    big_braille_combiner
    string = ""
    @mama_braille.each do |braille_array|
      string << "#{braille_array.join}\n"
    end
    string
  end

  def write_file
    braille = File.open(ARGV[1], "w")
    characters = File.write(ARGV[1], print)
    braille.close
    characters
  end

end

object = NightWriter.new
object.write_file
