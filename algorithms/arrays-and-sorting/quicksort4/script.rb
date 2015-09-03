def swap!(array, from, to)
  temp = array[to]
  array[to] = array[from]
  array[from] = temp
end

def partition(array, low, high)
  shifts = 0

  pivot = array[high]

  swapped = low

  (low...high).each do |index|
    element = array[index]

    if element <= pivot
      swap! array, index, swapped
      swapped += 1
      shifts += 1
    end
  end

  swap! array, high, swapped
  shifts += 1

  [swapped, shifts]
end

def quicksort(array, low = 0, high = array.length - 1)
  shifts = 0

  if low < high
    partition, shifts = partition array, low, high
    shifts += quicksort array, low, partition - 1
    shifts += quicksort array, partition + 1, high
  end

  shifts
end

def insertion_sort(array)
  final = array.dup

  shifts = 0

  1.upto array.length-1 do |i|
    element = array[i]

    insert_position = 0

    i.downto 1 do |j|
      temp = array[j-1]
      if element < temp
        array[j] = temp
        shifts += 1
      else
        insert_position = j
        break
      end
    end

    array[insert_position] = element
  end

  shifts
end

length = gets.to_i

items = gets.strip.split(' ').map &:to_i

quick_shifts = quicksort items.dup
insert_shifts = insertion_sort items.dup

p insert_shifts - quick_shifts
