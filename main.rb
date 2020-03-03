require './player'
require 'questions'
require './messages'
require './answers'
require './life'
require './input_output'

# puts @question
# puts @input

class Game 
  def initialize(p1, p2)
    @player1 = Player.new(p1)
    @player2 = Player.new(p2)
  end
  def run()
    puts "#{@player1.name}: #{@question}"
    gets.chomp
    puts "#{@player1.name}: #{@answer}"
    puts @player1.score
  end
  def stop?()
    player1.alive? && player2.alive?
  end
  def message
    if stop?
      puts '---- Game Over ----\nGood bye!'
    else
      puts'---- New Turn ----'
    end
  end
end

game = Game.new("Ahmed", "Anton")
game.run()