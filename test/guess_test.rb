require_relative 'test_helper'

class GuessTest < MiniTest::Test
  def test_users_guess
    card = Card.new("What is the capital of Alaskan?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal card, guess.card
  end

  def test_receives_response
    card = Card.new("What is the capital of Alaskan?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Juneau", guess.response
  end

  def test_check_if_response_is_correct
    card = Card.new("What is the capital of Alaskan?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert guess.correct?
  end

  def test_gives_feedback
    card = Card.new("What is the capital of Alaskan?", "Juneau")
    guess = Guess.new("Juneau", card)
    guess.correct?

    assert_equal "Correct!", guess.feedback
  end

  def test_guess_takes_card_argument
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal card, guess.card
  end

  def test_receives_response_for_a_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Saturn", guess.response
  end

  def test_check_if_response_is_false
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    refute guess.correct?
  end

  def test_gives_feedback_for_false_response
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    guess.correct?

    assert_equal "Incorrect.", guess.feedback
  end
end
