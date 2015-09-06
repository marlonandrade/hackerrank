require 'set'

ALL_TAGS = {}
ALL_TAGS_BY_IDX = nil
idx = 0

no_tags = gets.to_i

cities = []

City = Struct.new(:name, :tags)
Group = Struct.new(:cities, :tags) do
  def <=>(other)
    self.to_s <=> other.to_s
  end

  def to_s
    ts = tags.map { |t| ALL_TAGS_BY_IDX[t] }
    "#{cities.to_a.join(',')}:#{ts.join(',')}"
  end
  alias_method :inspect, :to_s
end

def add_cities_to_group(groups, tags, city, other)
  length = tags.length

  groups[length] ||= {}

  key = tags.join ','

  if groups[length][key]
    groups[length][key].cities << city.name
    groups[length][key].cities << other.name
  else
    common_cities = SortedSet.new
    common_cities << city.name
    common_cities << other.name

    groups[length][key] = Group.new(common_cities, tags)
  end
end

while line = gets
  name, tags_str = line.strip.split ':'
  tags = tags_str.split(',').sort

  tags = tags.map do |t|
    i = ALL_TAGS[t]

    unless i
      i = idx
      ALL_TAGS[t] = i
      idx += 1
    end

    i
  end

  cities << City.new(name, tags)
end

ALL_TAGS_BY_IDX = ALL_TAGS.invert

groups = {}
iterated = []

cities.each do |city|
  iterated << city
  others = cities - iterated

  others.each do |other|
    common_tags = city.tags & other.tags

    length = common_tags.length
    if length >= no_tags
      add_cities_to_group groups, common_tags, city, other

      while length > no_tags
        length -= 1

        common_tags.combination(length) do |c|
          add_cities_to_group groups, c, city, other
        end
      end
    end
  end
end

printed = Set.new

groups.sort do |(count_a, _), (count_b, _)|
  count_b <=> count_a
end.each do |_, common|
  common.sort do |(a_, a_line), (b_, b_line)|
    a_line <=> b_line
  end.each do |_, line|
    unless printed.include? line.cities
      p line
      printed << line.cities
    end
  end
end
