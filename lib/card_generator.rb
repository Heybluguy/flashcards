require "./lib/card"

class CardGenerator
  attr_reader :file
  def initialize(filename)
    @file = File.read(filename)
    @deck = []
  end

  def cards
    cards = @file.split("\n").map {|card| card.split(",")}
    cards.each do |card|
      @deck << Card.new(card[0], card[1])
    end
    @deck
  end
end
