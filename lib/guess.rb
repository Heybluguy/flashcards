require_relative "card"

class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @response = response
    @card = card
    @validation = correct?
  end

  def correct?
    if @response == @card.answer
      @validation = true
    else
      @validation = false
    end
  end

  def feedback
    if @validation == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end
