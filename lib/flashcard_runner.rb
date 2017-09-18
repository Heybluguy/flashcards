require_relative "guess"
require_relative "deck"
require_relative "card"
require_relative "round"
require "pry"

class FlashcardRunner
  attr_reader :card_1, :card_2, :card_3, :card_4, :deck, :round, :user_input, :current_card

  def initialize
    @card_1 = Card.new("What is 5 + 5?","10")
    @card_2 = Card.new("What is Rachel's favorite animal?","panda")
    @card_3 = Card.new("What is Mike's middle name?","nobody knows")
    @card_4 = Card.new("What cardboard cutout lives at Turing?","Justin Bieber")
    @deck = Deck.new([card_1, card_2, card_3, card_4])
    @round = Round.new(deck)
    @user_input = nil
    @current_card = nil
  end

  def get_input
    @user_input = gets.chomp
  end

  def begin_game
    puts "\n"
    puts "Welcome! You're playing with #{deck.cards.count} cards.".center(54)
    puts "-------------------------------------------------".center(54)
  end

  def which_round(num)
    @current_card = @deck.cards[num - 1]
    puts  "This is card number #{num} out of #{deck.cards.count}.".center(54)
  end

  def card_question
    puts "Question: #{current_card.question}".center(54)
  end

  def game_sequence(num)
    rounds = deck.count
    rounds.times do
      which_round(num)
      card_question
      get_input
      round.record_guess(user_input)
      puts "#{round.guesses.last.feedback}".center(54)
      round.index += 1
      num += 1
    end
    puts "****** Game over! ******".center(54)
    puts "You had #{round.number_correct} correct guesses out of #{deck.cards.count} for a score of #{round.percent_correct}%.".center(54)
  end
end

flashcard_runner = FlashcardRunner.new
flashcard_runner.begin_game
flashcard_runner.game_sequence(1)
