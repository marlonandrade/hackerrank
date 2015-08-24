class Grid < Array
  def rotate_grid
    arr = Grid.new
    self.each_with_index do |line, index|
      line.split('').each_with_index do |char, c_index|
        arr[c_index] ||= ''
        arr[c_index] << char
      end
    end
    arr
  end

  def contains_pattern?(pattern)
    result = false

    matches = matches_for_pattern pattern

    no_rows = pattern.size

    pattern_matches = {}
    matches.each do |row_matches|
      row_matches.each do |match|
        row = match[:row]
        column = match[:column]
        pattern_index = match[:pattern_index]

        pattern_matches[pattern_index] ||= []
        pattern_matches[pattern_index] << {
          row: row,
          column: column
        }
      end
    end

    if pattern_matches.size == pattern.size
      m = {}

      pattern_matches.sort.each do |index, matches|
        matches.each do |match|
          row = match[:row]
          column = match[:column]

          m[column] ||= []
          a = m[column]

          if a.empty? || a.include?(row - 1)
            a << row unless a.include?(row)
          end
        end
      end
    end

    m && m.each do |column, rows|
      if rows.size >= pattern.size
        result = true
        break
      end
    end

    result
  end

  private
  def matches_for_pattern(pattern)
    matches = []

    pattern.each_with_index do |p_row, index|
      rows_matched = rows_with p_row, index

      rows_matched.each do |m_index, match|
        matches << match
      end
    end

    matches
  end

  def rows_with(pattern, p_index)
    rows = {}

    self.each_with_index do |row, index|
      start = 0

      while start < row.length
        match = row.match pattern, start

        if match
          column_index = match.offset(0).first

          rows[index] ||= []
          rows[index] << {
            pattern: pattern,
            pattern_index: p_index,
            row: index,
            column: column_index
          }

          start = column_index + 1
        else
          start = row.length
        end
      end
    end

    rows
  end
end

def gets_rows_and_columns
  gets.split(' ').map &:to_i
end

def gets_grid
  grid = Grid.new

  rows, columns = gets_rows_and_columns

  rows.times do |row|
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
