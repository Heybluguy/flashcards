require_relative "card"

class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @response = response
    @card = card
    @correct = @response == @card.answer
  end

  def correct?
    @correct
  end

  def feedback
    if @correct == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end
