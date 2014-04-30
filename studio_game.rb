require_relative 'player'
require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)
player4 = Player.new("shemp", 90)

player5 = Player.new("alvin", 50)
player6 = Player.new("simon", 80)
player7 = Player.new("theodore", 110)

#knuckleheads = Game.new("knuckleheads")
#knuckleheads.add_player(player1)
#knuckleheads.add_player(player2)
#knuckleheads.add_player(player3)
#knuckleheads.add_player(player4)
#knuckleheads.play(die.roll)

chipmunks = Game.new("chipmunks")
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.add_player(player7)
chipmunks.play(10)
chipmunks.print_stats

