class Questions
  attr_reader :question
  def initialize
    a = rand(1..20)
    b = rand(1..20)
    @question = `What does#{a} plus #{b} equal?`
  end
end