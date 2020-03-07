require './player'
require './questions'

class Game 
  def initialize(p1, p2)
    @player1 = Player.new(p1)
    @player2 = Player.new(p2)
    @turn = @player1
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
  def go?
    @player1.alive? && @player2.alive?
  end
  def run
    while go?
      @question = Question.new
      puts "#{@turn.name}: #{@question.question}"
      user_input = gets.chomp.to_i
      correct_answer?(user_input)
      puts "#{@turn.name}: #{@response}"
      puts "#{@player1.name}: #{@player1.score} vs #{@player2.name}: #{@player2.score}"
      message
      switch_turn?
    end
  end
  def message
    if go?
      puts'---- New Turn ----'
    else
      if !@player1.alive?
      puts "#{@player2.name} wins with a score of #{@player2.score}"
      elsif !@player2.alive?
        puts "#{@player1.name} wins with a score of #{@player1.score}"
      end
      puts "---- Game Over ----\nGood bye!"
    end
  end
end

game = Game.new("Ahmed", "Anton")
game.run