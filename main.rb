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
  def message
    if go?
      puts'---- New Turn ----'
    else
      puts '---- Game Over ----\nGood bye!'
    end
  end
  def run
    while go?
      puts "#{@turn.name}: #{@question}"
      user_input = gets.chomp
      puts "#{@turn.name}: #{@answer}"
      @turn.lose_life if user_input != @answer 
      puts @turn.score
      message
      switch_turn?
    end
  end
  def go?
    @player1.alive? && @player2.alive?
  end
  def switch_turn?
    @turn = (@turn == @player1) ? @player2 : @player1
  end
end

game = Game.new("Ahmed", "Shannon")
game.run