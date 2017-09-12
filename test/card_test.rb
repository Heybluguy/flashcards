require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardsTest < Minitest::Test
  def test_cards_have_questions
    card = Card.new("What is the capital of Alaskan?", "Juneau")
      expected = "What is the capital of Alaskan?"

      assert_equal expected, card.question
  end

  def test_cards_have_answers
    card = Card.new("What is the capital of Alaskan?", "Juneau")
      expected = "Juneau"

      assert_equal expected, card.answer
  end
end

class GuessTest < Minitest::Test
  def test_users_guess
    card = Card.new("What is the capital of Alaskan?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal card, guess.card
  end

  def test_receives_response
    card = Card.new("What is the capital of Alaskan?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert guess.response
  end

  def test_check_if_response_is_correct
    card = Card.new("What is the capital of Alaskan?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert guess.correct?
  end



  end

end
