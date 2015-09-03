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

  if lesser.length > 1
    lesser = partition lesser
  end

  if greater.length > 1
    greater = partition greater
  end

  merge = [lesser, [pivot], greater].flatten

  puts merge.join ' '

  merge
end

def quicksort(array)
  partitions = partition array
end

length = gets.to_i

items = gets.strip.split(' ').map &:to_i

quicksort items
