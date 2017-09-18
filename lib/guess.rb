require_relative "card"
require "pry"

class Guess
  attr_reader :card, :response, :validation

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
      # puts "Correct!".center(54)
      "Correct!"
    else
      # puts "Incorrect.".center(54)
      "Incorrect."
    end
  end
end
