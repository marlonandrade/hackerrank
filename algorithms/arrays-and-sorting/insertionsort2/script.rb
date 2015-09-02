def insertion_sort(array)
  final = array.dup

  1.upto array.length-1 do |i|
    element = array[i]

    insert_position = 0

    i.downto 1 do |j|
      temp = array[j-1]
      if element < temp
        array[j] = temp
      else
        insert_position = j
        break
      end
    end

    array[insert_position] = element

    puts array.join ' '
  end
end

length = gets.to_i
items = gets.strip.split(' ').map &:to_i

insertion_sort items
