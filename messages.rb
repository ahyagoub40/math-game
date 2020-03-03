class Messages
  def message
    if @player1_life == 0 || @player2_life == 0
      puts '---- Game Over ----\nGood bye!'
    else
      puts'---- New Turn ----'
    end
  end
end