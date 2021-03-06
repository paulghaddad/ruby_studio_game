require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserk_player'
require_relative 'game'

#player1 = Player.new("moe")
#player2 = Player.new("larry", 60)
#player3 = Player.new("curly", 125)
#player4 = Player.new("shemp", 90)

#player5 = Player.new("alvin", 50)
#player6 = Player.new("simon", 80)
#layer7 = Player.new("theodore", 110)

#knuckleheads = Game.new("knuckleheads")
#knuckleheads.add_player(player1)
#knuckleheads.add_player(player2)
#knuckleheads.add_player(player3)
#knuckleheads.add_player(player4)
#knuckleheads.play(die.roll)

chipmunks = Game.new("chipmunks")
chipmunks.load_players( ARGV.shift || "players.csv" )
klutz = ClumsyPlayer.new('klutz', 105, 3)
chipmunks.add_player(klutz)
berserker = BerserkPlayer.new('berserker', 50)
chipmunks.add_player(berserker)

# Create a loop that allows users to continue playing, or to exit.

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  number_of_rounds = gets.chomp.downcase
  
  case number_of_rounds
    when /^\d+$/
      chipmunks.play(number_of_rounds.to_i)
    when "quit", "exit"
      chipmunks.print_stats
      chipmunks.save_high_scores
      break
    else
      puts "Please enter a number or 'quit'"
  end
end







