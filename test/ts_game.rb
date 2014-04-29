require 'test/unit'

require_relative '../studio_game'

class GameTest < Test::Unit::TestCase

  def setup
    @initial_health = 100
    @test_player = Player.new("Test Player", @initial_health)
    @new_game = Game.new("New Game")
    @new_game.add_player(@test_player)
    @rounds = 1
  end

  def test_create_new_game_class
    assert_kind_of(Game, @new_game)
  end

  def test_add_player_to_game
    assert_equal([@test_player], @new_game.players)
  end

  def test_roll_high_number
    @new_game.play(@rounds)
    #assert_equal(@initial_health + 15, @test_player.health )
  end

  def test_roll_medium_number
    @new_game.play(@rounds)
    #assert_equal(@initial_health, @test_player.health )
  end

  def test_roll_low_number
    @new_game.play(@rounds)
    #assert_equal(@initial_health - 10, @test_player.health )
  end

  def test_play_method
    @new_game.play(@rounds)
  end

end