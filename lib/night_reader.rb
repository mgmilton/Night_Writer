class NightReader

  def initialize(letters)
    @braille_top = []
    @braille_middle = []
    @braille_bottom = []
    @big_braille_top = []
    @big_braille_middle = []
    @big_braille_bottom = []
    @mama_braille = []
    @braille_by_six = []
    @eng_array = []
    @locations = []
    @eng_string = ""
    @letters = letters
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


 def big_braille_maker
   @letters.each_line.with_index do |line, index|
    if index % 3 == 0
      @big_braille_top << line.split("")
    elsif index % 3 == 1
      @big_braille_middle << line.split("")
    elsif index % 3 == 2
      @big_braille_bottom << line.split("")
    end
  end
 end

#below method removes \n characters from big_braille_top
 def big_braille_popper
   big_braille_maker
   @big_braille_top.map do |x|
     x.pop
   end
   @big_braille_middle.map do |x|
     x.pop
   end
   @big_braille_bottom.map do |x|
     x.pop
   end
 end

 def big_braille_flattener
   big_braille_popper
   @braille_top = @big_braille_top.flatten
   @braille_middle = @big_braille_middle.flatten
   @braille_bottom = @big_braille_bottom.flatten
 end

 def mama_braille_maker
   big_braille_flattener
   counter = 0
   @braille_top.length.times do
     @mama_braille << @braille_top[counter]
     @mama_braille << @braille_top[counter+1]
     @mama_braille << @braille_middle[counter]
     @mama_braille << @braille_middle[counter+1]
     @mama_braille << @braille_bottom[counter]
     @mama_braille << @braille_bottom[counter+1]
     counter += 2
   end
   @mama_braille.compact!
 end

 def tostring_toarraybysix
   mama_braille_maker
   mama_string = @mama_braille.join("")
   @braille_by_six = mama_string.scan(/.{6}/)
 end

 def braille_to_eng
   tostring_toarraybysix
   @braille_by_six.each do |braille|
     @eng_array << BRAILLE_DICTIONARY.key(braille)
   end
 end

 def capshiftfinder
   braille_to_eng
   @locations = @eng_array.each_index.select {|index| @eng_array[index] == "CapShift"}
   @locations.map! do |location|
     location + 1
   end
 end

 def capitalizer
   capshiftfinder
   @eng_array.map!.with_index do |value, index|
     if @locations.include?(index)
       value.upcase
     else
       value
     end
   end
 end

 def capshift_deleter
   capitalizer
   @eng_array.delete("CapShift")
 end

 def eng_array_to_string
   capshift_deleter
   @eng_string = @eng_array.join("")
 end

 def print
   eng_array_to_string
   p @eng_string
 end

end

l = NightReader.new("..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..
..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0.......
..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0
00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..
.0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00..
...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.0
00..00..0.
.....0...0
00.000.000")
l.print
