require "./lib/guess"
require "./lib/deck"
require "./lib/card"
require "./lib/round"
require "./lib/card_generator"

class FlashcardRunner
  attr_reader :deck, :round, :user_input, :current_card

  def initialize(filename)
    @deck = Deck.new(CardGenerator.new(filename).cards)
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
      num += 1
    end
    puts "****** Game over! ******".center(54)
    puts "You had #{round.number_correct} correct guesses out of #{deck.cards.count} for a score of #{round.percent_correct}%.".center(54)
  end
end

puts "What file would you like to use?"
input = gets.chomp
flashcard_runner = FlashcardRunner.new(input)
flashcard_runner.begin_game
flashcard_runner.game_sequence(1)
