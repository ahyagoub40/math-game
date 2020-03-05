class Question
  attr_accessor :question, :answer
  def initialize
    a = rand(1..20)
    b = rand(1..20)
    self.question = "What does #{a} plus #{b} equal?"
    self.answer = a + b
  end
end