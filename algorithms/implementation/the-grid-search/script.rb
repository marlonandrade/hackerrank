class Grid < Array
  attr_accessor :rows, :columns

  def contains_pattern?(pattern)
    result = false

    regex = ''

    difference = self.columns - pattern.columns

    pattern.each_with_index do |row, index|
      regex << row
      regex << "[0-9_]"

      if index == pattern.size - 1
        regex << "{#{difference / 2}}"
      else
        regex << "{#{difference + 1}}"
      end
    end

    self.join('_').match regex
  end
end

def gets_rows_and_columns
  gets.split(' ').map &:to_i
end

def gets_grid
  grid = Grid.new

  grid.rows, grid.columns = gets_rows_and_columns

  grid.rows.times do |row|
    grid << gets.strip
  end

  grid
end

test_cases = gets.to_i
test_cases.times do
  grid = gets_grid
  pattern = gets_grid

  if grid.contains_pattern? pattern
    puts 'YES'
  else
    puts 'NO'
  end
end
