eng_array = ["a", "CapShift", "b", "d", "CapShift", "c"]

def capreplacer(eng_array)
  locations = eng_array.each_index.select{|i| eng_array[i] == "CapShift"}

  locations.map! do |location|
    location+1
  end

  eng_array.each_with_index do |value, index|
    if locations.include?(index)
      value.upcase!
    else
      value
    end
  end
end
p capreplacer(eng_array)
def capshift_caller
  english = braille_to_english
  locations = capshift_finder(english)
  locs_plus_one = locations_plus_one(locations)
  new_english = capitalizer(english, locs_plus_one)
  english_no_capshift = capshift_deleter(new_english)
  eng_array_to_string(english_no_capshift)
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
