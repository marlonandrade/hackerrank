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

  p shifts
end

length = gets.to_i
items = gets.strip.split(' ').map &:to_i

insertion_sort items
