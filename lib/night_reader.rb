class NightReader

  def initialize(letters= "")
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

def big_braille_top_maker(big_braille_top= [])
  @letters.each_line.with_index do |line, index|
    if index % 3 == 0
      big_braille_top << line.split("")
    end
  end
  big_braille_top
end

def big_braille_middle_maker(big_braille_middle= [])
  @letters.each_line.with_index do |line, index|
    if index % 3 == 1
      big_braille_middle << line.split("")
    end
  end
  big_braille_middle
end

def big_braille_bottom_maker(big_braille_bottom= [])
  @letters.each_line.with_index do |line, index|
    if index % 3 == 2
      big_braille_bottom << line.split("")
    end
  end
  big_braille_bottom
end

 def big_braille_top_popper(top= [])
   top.map do |line|
     line.pop
   end
   top
 end

 def big_braille_middle_popper(middle= [])
   middle.map do |line|
     line.pop
   end
   middle
 end

 def big_braille_bottom_popper(bottom= [])
   bottom.map do |line|
     line.pop
   end
   bottom
 end

 def big_braille_top_flattener(top_pop= [])
   top_pop.flatten
 end

 def big_braille_middle_flattener(middle_pop= [])
   middle_pop.flatten
 end

 def big_braille_bottom_flattener(bottom_pop= [])
   bottom_pop.flatten
 end

 def big_braille_top_caller
   top = big_braille_top_maker
   top_pop = big_braille_top_popper(top)
   top_flat = big_braille_top_flattener(top_pop)
 end

 def big_braille_middle_caller
   middle = big_braille_middle_maker
   middle_pop = big_braille_middle_popper(middle)
   middle_flat = big_braille_middle_flattener(middle_pop)
 end

 def big_braille_bottom_caller
   bottom = big_braille_bottom_maker
   bottom_pop = big_braille_bottom_popper(bottom)
   bottom_flat = big_braille_bottom_flattener(bottom_pop)
 end

 def total_braille_maker(top_flat= [], middle_flat= [], bottom_flat= [], counter= 0, total_braille= [])
   big_braille_top_caller.length.times do
     total_braille << big_braille_top_caller[counter]
     total_braille << big_braille_top_caller[counter+1]
     total_braille << big_braille_middle_caller[counter]
     total_braille << big_braille_middle_caller[counter+1]
     total_braille << big_braille_bottom_caller[counter]
     total_braille << big_braille_bottom_caller[counter+1]
     counter += 2
   end
   total_braille.compact!
 end

 def total_braille_string
   total_string = total_braille_maker.join("")
 end

 def total_braille_by_six
    total_braille_by_six = total_braille_string.scan(/.{6}/)
 end

 def braille_to_english(english_array= [])
   total_braille_by_six.each do |braille|
     english_array << BRAILLE_DICTIONARY.key(braille)
   end
   english_array
 end

 def capshift_finder(english= [])
   locations = english.each_index.select {|index| english[index] == "CapShift"}
 end

 def locations_plus_one(locations= [], locs_plus_one= [])
   locations.each do |location|
     locs_plus_one << location + 1
   end
   locs_plus_one
 end
 #
 # def capitalizer(english)
 #   english.each_with_index do |value, index|
 #     if value == "CapShift"
 #        english[index+1] = value.upcase
 #

 def capitalizer(english, locs_plus_one= [])
   english.map!.with_index do |value, index|
     if locs_plus_one.include?(index)
       value.upcase
     else
       value
     end
   end
   english
 end

 def capshift_deleter(english= [])
   english.delete("CapShift")
   english
 end

 def eng_array_to_string(english_no_capshift= [])
   english_no_capshift.join("")
 end

 def capshift_caller
   english = braille_to_english
   locations = capshift_finder(english)
   locs_plus_one = locations_plus_one(locations)
   new_english = capitalizer(english, locs_plus_one)
   english_no_capshift = capshift_deleter(new_english)
   eng_array_to_string(english_no_capshift)
 end

 def print
   puts capshift_caller
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
