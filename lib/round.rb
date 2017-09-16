require_relative "guess"

class Round
  attr_reader :guesses, :deck
  def initialize(deck)
    @deck = deck
    @guesses = []
    @index = 0
    @correct = 0
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
    guess_feedback = @guesses.map do |guess|
      guess.feedback
    end
    (guess_feedback.select { |feedback| feedback == "Correct!"}).count
  end

  def percent_correct
    (number_correct.to_f / @guesses.count.to_f * 100.0)
    .to_i
  end

end
