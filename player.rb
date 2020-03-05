class Player
  attr_accessor :name
  def initialize(name)
  self.name = name
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


