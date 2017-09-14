require_relative 'test_helper'

class RoundTest < MiniTest::Test
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
    round.record_guess("Juneau")
    round.record_guess("93,000")

    assert_equal 1, round.number_correct
  end

  def test_starts_rounds
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_guesses_in_rounds
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_what_is_the_current_card
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")

      assert_equal card_2, round.current_card
  end

  def test_record_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess("Juneau")

    assert_instance_of Guess, guess
    assert_equal "Juneau", guess.response
  end

  def test_count_multiple_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("test answer")
    round.record_guess("test answer")

    1000.times do #hehe
      assert_equal 2, round.guesses.count
    end
  end

end
