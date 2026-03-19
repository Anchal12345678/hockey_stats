require 'csv'
require 'faker'

puts "Clearing old data..."
Stat.destroy_all
Player.destroy_all
Team.destroy_all

# ── Seed Teams from CSV ──────────────────────────────────────────
puts "Seeding teams..."
CSV.foreach(Rails.root.join('db', 'teams.csv'), headers: true) do |row|
  Team.create!(
    name:       row['name'],
    city:       row['city'],
    conference: row['conference'],
    division:   row['division']
  )
end
puts "  #{Team.count} teams created."

# ── Seed Players from CSV ────────────────────────────────────────
puts "Seeding players from CSV..."
CSV.foreach(Rails.root.join('db', 'players.csv'), headers: true) do |row|
  team = Team.find_by(name: row['team_name'])
  next unless team

  Player.create!(
    first_name:    row['first_name'],
    last_name:     row['last_name'],
    position:      row['position'],
    nationality:   row['nationality'],
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 38),
    team:          team
  )
end
puts "  #{Player.count} players created from CSV."

# ── Seed Extra Fake Players using Faker ──────────────────────────
puts "Seeding fake players with Faker..."
positions     = ['Center', 'Left Wing', 'Right Wing', 'Defenseman', 'Goalie']
nationalities = ['Canadian', 'American', 'Swedish', 'Finnish', 'Russian', 'Czech', 'German']

Team.all.each do |team|
  6.times do
    Player.create!(
      first_name:    Faker::Name.first_name,
      last_name:     Faker::Name.last_name,
      position:      positions.sample,
      nationality:   nationalities.sample,
      date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 38),
      team:          team
    )
  end
end
puts "  #{Player.count} total players after Faker."

# ── Seed Stats for every Player ──────────────────────────────────
puts "Seeding stats..."
seasons = ['2021-22', '2022-23', '2023-24']

Player.all.each do |player|
  seasons.each do |season|
    gp      = rand(20..82)
    goals   = rand(0..55)
    assists = rand(0..75)
    Stat.create!(
      player:       player,
      season:       season,
      games_played: gp,
      goals:        goals,
      assists:      assists,
      points:       goals + assists,
      plus_minus:   rand(-30..30)
    )
  end
end
puts "  #{Stat.count} stats created."
puts "Done! 🏒"