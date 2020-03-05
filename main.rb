require './player'
require './questions'

# puts @question
# puts @input

class Game 
  def initialize(p1, p2)
    @player1 = Player.new(p1)
    @player2 = Player.new(p2)
    @turn = @player1
  end
  def messages
    if go?
      puts'---- New Turn ----'
    else
      puts '---- Game Over ----\nGood bye!'
    end
  end
  def go?
    @player1.alive? && @player2.alive?
  end
  def switch_turn?
    @turn = (@turn == @player1) ? @player2 : @player1
  end
  def correct_answer?(user_answer)
    if user_answer == @question.answer
      @response = "correct"
    else
      @turn.lose_life 
      @response = "wrong answer"
    end
  end
  def run
    while go?
      @question = Question.new
      puts "#{@turn.name}: #{@question.question}"
      user_input = gets.chomp.to_i
      correct_answer?(user_input)
      puts "#{@turn.name}: #{@response}"
      puts @turn.score
      message
      switch_turn?
    end
  end
end

game = Game.new("Ahmed", "Shannon")
game.run