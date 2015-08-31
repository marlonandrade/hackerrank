gems = []

rocks = gets.to_i
rocks.times do
  rock = gets.strip.split('')
  gems << rock.uniq.sort
end

all_rocks = ('a'..'z').to_a

p gems.reduce(all_rocks, :&).size
