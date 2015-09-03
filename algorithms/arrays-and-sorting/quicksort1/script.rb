def partition(array)
  pivot = array.slice! 0

  lesser = []
  greater = []

  array.each do |element|
    if element > pivot
      greater << element
    else
      lesser << element
    end
  end

  [lesser, [pivot], greater]
end

def quicksort(array)
  partitions = partition array

  puts partitions.join ' '
end

length = gets.to_i

items = gets.strip.split(' ').map &:to_i

quicksort items
