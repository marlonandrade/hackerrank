def swap!(array, from, to)
  temp = array[to]
  array[to] = array[from]
  array[from] = temp
end

def partition(array, low, high)
  pivot = array[high]

  swapped = low

  (low...high).each do |index|
    element = array[index]

    if element <= pivot
      swap! array, index, swapped
      swapped += 1
    end
  end

  swap! array, high, swapped

  puts array.join ' '

  swapped
end

def quicksort(array, low = 0, high = array.length - 1)
  if low < high
    partition = partition array, low, high
    quicksort array, low, partition - 1
    quicksort array, partition + 1, high
  end
end

length = gets.to_i

items = gets.strip.split(' ').map &:to_i

quicksort items
