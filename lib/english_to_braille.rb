class EnglishToBraille

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

  def letter_array_generator
    @letters.split("")
  end

  def capitalized_checker(new_letters= [])
    letter_array_generator.each do |letter|
      capshift_adder(letter, new_letters)
    end
    new_letters
  end

  def capshift_adder(letter, downcase_letters)
    if letter == letter.upcase && letter != letter.downcase
      downcase_letters << "CapShift"
      downcase_letters << letter.downcase
    else
      downcase_letters << letter
    end
  end

  def english_to_braille_translator(braille_array= [])
    capitalized_checker.each do |character|
      braille_array << BRAILLE_DICTIONARY[character]
    end
    braille_array
  end

  def braille_array_compactor
    english_to_braille_translator.compact
  end

  def braille_string_generator
    braille_array_compactor.join("")
  end

  def string_splitter_by_two
    braille_array_by_two =  braille_string_generator.scan(/.{2}/)
  end

  def braille_top_maker(braille_top= [])
    string_splitter_by_two.each_with_index do |value, index|
      index_checker(braille_top, value, index, 0)
    end
    braille_top
  end

  def braille_middle_maker(braille_middle= [])
    string_splitter_by_two.each_with_index do |value, index|
      index_checker(braille_middle, value, index, 1)
    end
    braille_middle
  end

  def braille_bottom_maker(braille_bottom= [])
    string_splitter_by_two.each_with_index do |value, index|
      index_checker(braille_bottom, value, index, 2)
    end
    braille_bottom
  end

  def big_braille_top_maker(top= [], big_braille_top= [])
    argument_raiser(top)
    until top.empty?
      big_braille_top << top.shift(40)
    end
    big_braille_top
  end

  def big_braille_middle_maker(middle= [], big_braille_middle= [])
    argument_raiser(middle)
    until middle.empty?
      big_braille_middle << middle.shift(40)
    end
    big_braille_middle
  end

  def big_braille_bottom_maker(bottom= [], big_braille_bottom= [])
    argument_raiser(bottom)
    until bottom.empty?
      big_braille_bottom << bottom.shift(40)
    end
    big_braille_bottom
  end

  def big_braille_combiner(top= [], middle= [], bottom= [], counter= 0, total_braille= [])
    top.length.times do
      total_braille << top[counter]
      total_braille << middle[counter]
      total_braille << bottom[counter]
      counter +=1
    end
    total_braille
  end

  def big_braille_caller
    top = braille_top_maker
    middle = braille_middle_maker
    bottom = braille_bottom_maker
    big_top = big_braille_top_maker(top)
    big_middle =  big_braille_middle_maker(middle)
    big_bottom = big_braille_bottom_maker(bottom)
    big_braille_combiner(big_top, big_middle, big_bottom)
  end

  def index_checker(braille, value, index, remainder)
    argument_raiser(braille)
    if index % 3 == remainder
      braille << value
    end
  end

  def argument_raiser(section, classtype= Array)
    if section.class != classtype
      raise ArgumentError
    end
  end


  def print
    string = ""
    big_braille_caller.each do |braille_array|
      string += braille_array.join
      string += "\n"
    end
    string
  end
end
