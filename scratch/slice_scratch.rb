def slicer
  bt80 =[]
  bt =[*0..256]
  until bt.empty?
    bt80 << bt.shift(80)
  end
  require 'pry'; binding.pry
  bt80
end
slicer


def combiner
  bt80 =[[*0..79], [*80..159], [*160..239], [*240..256]]
  bm80 =[[*0..79], [*80..159], [*160..239], [*240..256]]
  bb80 = [[*0..79], [*80..159], [*160..239], [*240..256]]
  counter = 0
  z = []
  bt80.length.times do
     z << bt80[counter]
     z << bm80[counter]
     z << bb80[counter]
     counter +=1
   end
   z
 end

p combiner
