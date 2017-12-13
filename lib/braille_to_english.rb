
class BrailleToEnglish

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
   argument_raiser(big_braille_top)
   @letters.each_line.with_index do |line, index|
     line_splitter_per_index(big_braille_top, line, index, 0)
   end
   big_braille_top
 end

 def big_braille_middle_maker(big_braille_middle= [])
   argument_raiser(big_braille_middle)
   @letters.each_line.with_index do |line, index|
     line_splitter_per_index(big_braille_middle, line, index, 1)
   end
   big_braille_middle
 end

 def big_braille_bottom_maker(big_braille_bottom= [])
   argument_raiser(big_braille_bottom)
   @letters.each_line.with_index do |line, index|
     line_splitter_per_index(big_braille_bottom, line, index, 2)
   end
   big_braille_bottom
 end

 def big_braille_top_popper(top= [])
   popper(top)
   top
 end

 def big_braille_middle_popper(middle= [])
   popper(middle)
   middle
 end

 def big_braille_bottom_popper(bottom= [])
   popper(bottom)
   bottom
 end

 def big_braille_top_flattener(top_pop= [])
   flattener(top_pop)
 end

 def big_braille_middle_flattener(middle_pop= [])
   flattener(middle_pop)
 end

 def big_braille_bottom_flattener(bottom_pop= [])
   flattener(bottom_pop)
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

 def total_braille_maker(counter= 0, total_braille= [])
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
   argument_raiser(english_array)
   total_braille_by_six.each do |braille|
     english_array << BRAILLE_DICTIONARY.key(braille)
   end
   english_array
 end

 def capshift_finder(english= [])
   argument_raiser(english)
   locations = english.each_index.select {|index| english[index] == "CapShift"}
 end

 def locations_plus_one(locations= [], locs_plus_one= [])
   argument_raiser(locations)
   locations.each do |location|
     locs_plus_one << location + 1
   end
   locs_plus_one
 end

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
   argument_raiser(english)
   english.delete("CapShift")
   english
 end

 def eng_array_to_string(english_no_capshift= [])
   argument_raiser(english_no_capshift)
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

 def line_splitter_per_index(braille, line, index, remainder)
   argument_raiser(braille)
   if index % 3 == remainder
     braille << line.split("")
   end
 end

 def popper(lines= [])
   argument_raiser(lines)
   lines.map do |line|
     line.pop
   end
 end

 def flattener(nestedarray= [])
   argument_raiser(nestedarray)
   nestedarray.flatten
 end

 def argument_raiser(section, classtype= Array)
   if section.class != classtype
     raise ArgumentError
   end
 end

 def print
   puts capshift_caller
 end

end
