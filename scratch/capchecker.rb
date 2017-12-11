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
