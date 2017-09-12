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
  def initialize(response, card)
    @response = response
    @card = card
    @correct = false
  end

  def card
    @card
  end

  def response
    @response
  end

  def correct?
    @correct = true if @response == @card.answer
  end

end
