class Card
  def initialize(question, answer)
    @question = question
    @answer = answer
  end

  def question
    @question
  end

  def answer
    @answer
  end
end

class Guess
  attr_reader :card, :response
  
  def initialize(response, card)
    @response = response
    @card = card
    @correct = false
  end

  def correct?
    @correct = true if @response == @card.answer
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

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end
end
