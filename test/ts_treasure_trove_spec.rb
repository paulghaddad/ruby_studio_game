require 'test/unit'

require_relative '../studio_game'

class TreasureTroveTest < Test::Unit::TestCase

  def setup
    @test_treasure = TreasureTrove::Treasure.new(:test, 100)
  end

  def test_treasure_name
    assert_equal(:test, @test_treasure.name)
  end

  def test_treasure_points
    assert_equal(100, @test_treasure.points)
  end

end