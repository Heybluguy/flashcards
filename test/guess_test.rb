require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require './lib/round'
require './lib/deck'

class GuessTest < Minitest::Test
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

  def test_how_many_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("response")

    assert_equal 1, round.guesses.count
  end

  def test_guesses_first_give_correct_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")

    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_guesses_first_give_incorrect_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("James")

    assert_equal "Incorrect.", round.guesses.first.feedback
  end

  def test_correct_guesses_in_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal 1, round.number_correct
  end
end
