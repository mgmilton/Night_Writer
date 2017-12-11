# class NightWriter
#
#   def initialize(letters)
#     @braille_top = []
#     @braille_middle = []
#     @braille_bottom = []
#     @big_braille_top = []
#     @big_braille_middle = []
#     @big_braille_bottom = []
#     @mama_braille = []
#     @letters = letters
#   end

  # BRAILLE_DICTIONARY ={
  #                 "a"=> "0.....",
  #                  "b"=>"0.0...",
  #                  "c"=>"00....",
  #                  "d"=>"00.0..",
  #                  "e"=>"0..0..",
  #                  "f"=>"000...",
  #                  "g"=>"0000..",
  #                  "h"=>"0.00..",
  #                  "i"=>".00...",
  #                  "j"=>".000..",
  #                  "k"=>"0...0.",
  #                  "l"=>"0.0.0.",
#                    "m"=>"00..0.",
#                    "n"=>"00.00.",
#                    "o"=>"0..00.",
#                    "p"=>"000.0.",
#                    "q"=> "00000.",
#                    "r"=>"0.000.",
#                    "s"=>".00.0.",
#                    "t"=>".0000.",
#                    "u"=>"0...00",
#                    "v"=>"0.0.00",
#                    "w"=>".000.0",
#                    "x"=>"00..00",
#                    "y"=>"00.000",
#                    "z"=>"0..000",
#                    "CapShift"=>".....0",
#                    " "=>"......",
#                    "#"=>".0.000",
#                    "!"=>"..000.",
#                    "'"=>"....0.",
#                    ","=>"..0...",
#                    "-"=>"....00",
#                    "?"=> "..0.00",
#                    "."=>"..00.0"}
#
#
# puts BRAILLE_DICTIONARY.invert
  # def capitalized_checker
  #   special_chars = [" ", "#", "!", "'", ",","-", "?", "."]
  #   letters_array = @letters.split("")
  #   new_letters = letters_array.map do |letter|
  #     if special_chars.include?(letter)
  #       letter
  #     elsif letter == letter.upcase
  #       ["CapShift", letter.downcase]
  #     else
  #       letter
  #     end
  #   end
  #   new_letters
  # end
  #
  # end
  #
  # morse = NightWriter.new("!ABC#abc")
  # puts morse.capitalized_checker


  ENGLISH_DICTIONARY = {"0....."=>"a",
                        "0.0..."=>"b",
                        "00...."=>"c",
                        "00.0.."=>"d",
                        "0..0.."=>"e",
                        "000..."=>"f",
                        "0000.."=>"g",
                        "0.00.."=>"h",
                        ".00..."=>"i",
                        ".000.."=>"j",
                        "0...0."=>"k",
                        "0.0.0."=>"l",
                        "00..0."=>"m",
                        "00.00."=>"n",
                        "0..00."=>"o",
                        "000.0."=>"p",
                        "00000."=>"q",
                        "0.000."=>"r",
                        ".00.0."=>"s",
                        ".0000."=>"t",
                        "0...00"=>"u",
                        "0.0.00"=>"v",
                        ".000.0"=>"w",
                        "00..00"=>"x",
                        "00.000"=>"y",
                        "0..000"=>"z",
                        ".....0"=>"CapShift",
                        "......"=>" ",
                        ".0.000"=>"#",
                        "..000."=>"!",
                        "....0."=>"'",
                        "..0..."=>",",
                        "....00"=>"-",
                        "..0.00"=>"?",
                        "..00.0"=>"."}

  def array_by_two
    braille =
    "..0.0.00..\n....0...00\n.0......0."
    new_braille = braille.split("\n")
    array_by_two = []
    new_braille.each do |element|

      array_by_two << element.scan(/.{2}/)
    end
    array_by_two
  end

  def shovel
    count = 0
    mamma_array = []
    until count == array_by_two[0].length
      mamma_array << array_by_two[0][count]
      mamma_array << array_by_two[1][count]
      mamma_array << array_by_two[2][count]
      count += 1
    end
    mamma_array.join
  end

  def method_for_scan_by_6
    array_by_6 = shovel.scan(/.{6}/)
  end

  def to_english
    english_array = []
    method_for_scan_by_6.each do |letter|
    english_array << ENGLISH_DICTIONARY[letter]
  end
  english_array.join
  end

  def check_capitals
    to_english.each do |letter|
      if letter == "CapShift"
        then 
        #then need to delete the capshift and somehow indicate the next/then time around change letter to letter.upcase
  end

puts to_english
