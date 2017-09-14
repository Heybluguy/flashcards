require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/round'
require './lib/deck'


class CardsTest < MiniTest::Test
  def test_card_one_has_a_question
    card = Card.new("What is the capital of Alaskan?", "Juneau")
      expected = "What is the capital of Alaskan?"

      assert_equal expected, card.question
  end

  def test_card_one_has_an_answer
    card = Card.new("What is the capital of Alaskan?", "Juneau")
      expected = "Juneau"

      assert_equal expected, card.answer
  end

  def test_cards_stored_inside_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_count_the_cards_stored_inside_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal 3, deck.count
  end



end
