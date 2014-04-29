require 'test/unit'

require_relative '../studio_game'

class PlayerTest < Test::Unit::TestCase

  def setup
    @initial_health = 100
    @test_player = Player.new("Bob", @initial_health)
  end

  def test_name_is_capitalized
    assert_equal('Bob', @test_player.name)
  end

  def test_player_has_an_initial_health    
    assert_equal(100, @test_player.health)
  end

  def test_player_to_a_string
    assert_equal("I'm Bob with a health of 100 and a score of 103.", @test_player.to_s)
  end

  def test_player_score
    assert_equal(100 + 3, @test_player.score)
  end

  def test_player_score_increases_by_15_when_w00ted
    @test_player.w00t
    assert_equal(@initial_health + 15, @test_player.health)
  end

  def test_player_score_decreases_by_10_when_blammed
    @test_player.blam
    assert_equal(@initial_health - 10, @test_player.health)
  end

  def test_player_is_strong
    @strong_player = Player.new("Joe", 150)
    assert(@strong_player.strong?)
  end

  def test_player_is_not_strong
    @weak_player = Player.new("Joe", 100)
    refute(@weak_player.strong?)
  end

end