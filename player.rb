class Player
  def initialize(name)
    @name = name
    @life = 3
  end
  def lose_life
    @life -= 1
  end
  def alive?
    @life > 0
  end
  def score
    "#{@life} / 3"
  end
end


