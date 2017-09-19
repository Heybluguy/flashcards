require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < MiniTest::Test
  def test_cards_exist
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    expected = 0
    assert_equal expected, cards
   end
 end
