require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'
require 'pry'

class CardGeneratorTest < MiniTest::Test
  def test_cards_exist
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    assert_instance_of Array, cards
    assert_instance_of Card, cards.first
   end
 end
