require_relative 'game_turn'
require_relative 'treasure_trove'

class Game

  attr_reader :title
  attr_accessor :players

  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def high_score_entry(player)
    player.name.ljust(30, '.') + player.score.to_s
  end

  def load_players(from_file)
    File.open(from_file, "r") do |file|
      file.each_line do |line|
        add_player(Player.from_csv(line))
      end
    end
  end

  def save_high_scores(to_file="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title} high scores:"
      @players.sort.each do |player|
        file.puts high_score_entry(player)
      end
    end

  end

  def add_player(player_name)
    @players << player_name
  end

  def total_points
    @players.reduce(0) { |sum, player| sum += player.points }
  end

  def play(rounds)
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:" #print the list of possible treasures
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end


    1.upto(rounds) do |round_number|
      puts "\nRound #{round_number}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_player_and_score(player)
    puts "#{player.name} (#{player.score})"
  end

  def print_stats
    strong, wimpy = @players.partition { |player| player.strong? }
    puts "\n#{strong.count} Strong Players:"
    strong.each { |strong_player| print_player_and_score(strong_player) }

    puts "\n#{wimpy.count} Wimpy Players:"
    wimpy.each { |wimpy_player| print_player_and_score(wimpy_player) }

    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      puts high_score_entry(player)
    end

    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end

    puts "\n#{total_points} total points from treasures found."

  end

end