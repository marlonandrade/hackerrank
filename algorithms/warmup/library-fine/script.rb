ad, am, ay = gets.split(' ').map(&:to_i)
ed, em, ey = gets.split(' ').map(&:to_i)

fine = 0

if ay > ey
  fine = 10000
elsif ay == ey
  if am > em
    fine = (am - em) * 500
  elsif am == em && ad > ed
    fine = (ad - ed) * 15
  end
end

p fine
