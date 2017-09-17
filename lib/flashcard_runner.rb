require_relative "guess"
require_relative "deck"
require_relative "card"
require_relative "round"
require "pry"

class FlashcardRunner

  attr_reader :card_1, :card_2, :card_3, :card_4, :deck, :round, :user_input

  def initialize
    @card_1 = Card.new("What is 5 + 5?","10")
    @card_2 = Card.new("What is Rachel's favorite animal?","panda")
    @card_3 = Card.new("What is Mike's middle name?","nobody knows")
    @card_4 = Card.new("What cardboard cutout lives at Turing?","Justin Bieber")
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(deck)
    @user_input = nil
  end

  def get_input
    @user_input = gets.chomp
  end

  def begin_game
    puts "Welcome! You're playing with 4 cards.
    -------------------------------------------------"
  end
end



fcr = FlashcardRunner.new
binding.pry
