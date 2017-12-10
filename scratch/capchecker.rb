eng_array = ["a", "CapShift", "b", "C"]

def capreplacer(eng_array)
  eng_array.each do |x|
    if x == "CapShift"
      next
      x = x.upcase!
    end
  end
  require 'pry' ; binding.pry
end

capreplacer(eng_array)
