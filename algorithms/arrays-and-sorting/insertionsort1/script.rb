def insertion_sort(array)
  final = array.dup

  unsorted = array.last

  inserted = false

  (array.length - 2).downto 0 do |index|
    if array[index] > unsorted
      array[index+1] = array[index]
    else
      array[index+1] = unsorted
      inserted = true
    end

    puts array.join ' '

    break if inserted
  end

  unless inserted
    array[0] = unsorted
    puts array.join ' '
  end
end

length = gets.to_i
items = gets.strip.split(' ').map &:to_i

insertion_sort items
