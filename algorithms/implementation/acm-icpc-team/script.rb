def icpc_teams(people)
  skills = people.combination(2).map do |team|
    team.first | team.last
  end

  no_skills = skills.map { |s| s.to_s(2).count('1') }

  max = no_skills.max
  count = no_skills.select { |s| s == max }.count

  p max, count
end

def get_topics
  gets.strip.to_i 2
end

people = []

no_person, topics = gets.split(' ').map &:to_i
no_person.times do
  people << get_topics
end

icpc_teams people
