require_relative "guess"
require_relative "deck"

class Round
  def initialize(deck)
    @deck = deck
    @guesses = []
    @index = 0
    @correct = 0
  end

  def deck
    @deck
  end

  def guesses
  @guesses
  end

  def current_card
    @deck.cards[@index]
  end

  def record_guess(response)
    @guesses << Guess.new(response,current_card)
    @index += 1
    
    @guesses.last

  end

  def number_correct

  end
end