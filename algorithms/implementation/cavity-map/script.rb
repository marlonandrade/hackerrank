def cavities(map)
  new_map = []
  map.each do |row|
    new_map << row.dup
  end

  edges = [0, map.size - 1]

  map.each_with_index do |row, row_index|
    unless edges.include? row_index
      row.each_with_index do |cell, cell_index|
        unless edges.include? cell_index
          top_cell = map[row_index - 1][cell_index]
          bottom_cell = map[row_index + 1][cell_index]
          left_cell = row[cell_index - 1]
          right_cell = row[cell_index + 1]

          if (cell > top_cell &&
              cell > bottom_cell &&
              cell > left_cell &&
              cell > right_cell)
            new_map[row_index][cell_index] = 'X'
          end
        end
      end
    end
  end

  new_map
end

map = []
map_size = gets.to_i
map_size.times do
  map << gets.strip.split('').map(&:to_i)
end

new_map = cavities map
new_map.each { |row| puts row.join }
