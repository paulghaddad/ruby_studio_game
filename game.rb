require_relative 'game_turn'
require_relative 'treasure_trove'

class Game

  attr_reader :title
  attr_accessor :players

  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(player_name)
    @players << player_name
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

  def total_points
    @players.reduce(0) { |sum, player| sum += player.points }
  end

  def print_stats
    strong, wimpy = @players.partition { |player| player.strong? }
    puts "\n#{strong.count} Strong Players:"
    strong.each { |strong_player| print_player_and_score(strong_player) }

    puts "\n#{wimpy.count} Wimpy Players:"
    wimpy.each { |wimpy_player| print_player_and_score(wimpy_player) }

    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      puts player.name.ljust(30, '.') + player.score.to_s
    end

    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      puts "#{player.points} grand total points"
    end

    puts "\n#{total_points} total points from treasures found."

  end

end