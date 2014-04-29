require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'

module GameTurn

  def self.die_roll
    die = Die.new
    die.roll
  end

  def self.take_turn(player)
    
    case die_roll
      when 5..6
        player.w00t
      when 3..4
        puts "#{player.name} was skipped"
      else
        player.blam
    end

    treasure = TreasureTrove.random_treasure

    player.found_treasure(treasure)
    
  end

end