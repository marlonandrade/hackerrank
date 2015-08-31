class Matrix < Array
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
  end

  def rotation(times)
    rotated = Matrix.new @rows, @columns

    items = []

    buckets = [@rows, @columns].min / 2
    buckets.times do |bucket|
      items[bucket] ||= []

      rows_times = @rows - bucket * 2
      cols_times = @columns - bucket * 2 - 2

      rows_times.times do |row|
        items[bucket] << self[row + bucket][bucket]
      end

      cols_times.times do |column|
        items[bucket] << self[@rows - 1 - bucket][column + bucket + 1]
      end

      rows_times.times.reverse_each do |row|
        items[bucket] << self[row + bucket][@columns - 1 - bucket]
      end

      cols_times.times.reverse_each do |column|
        items[bucket] << self[bucket][column + bucket + 1]
      end
    end

    items.each_with_index do |item, bucket|
      item.rotate!(-times)

      rows_times = @rows - bucket * 2
      cols_times = @columns - bucket * 2 - 2

      rows_times.times do |row|
        rotated[row + bucket] ||= []
        rotated[row + bucket][bucket] = item.shift
      end

      cols_times.times do |column|
        rotated[@rows - 1 - bucket][column + bucket + 1] = item.shift
      end

      rows_times.times.reverse_each do |row|
        rotated[row + bucket][@columns - 1 - bucket] = item.shift
      end

      cols_times.times.reverse_each do |column|
        rotated[bucket][column + bucket + 1] = item.shift
      end
    end

    rotated
  end
end

def gets_initial_data
  gets.strip.split(' ').map &:to_i
end

def gets_matrix(rows, columns)
  matrix = Matrix.new(rows, columns)

  rows.times do |r|
    matrix << gets.strip.split(' ')
  end

  matrix
end

rows, columns, rotation = gets_initial_data
matrix = gets_matrix rows, columns

rotated_matrix = matrix.rotation rotation

rotated_matrix.each do |row|
  puts row.join(' ')
end
