require './Player'

class Game
  attr_reader :sum, :current_player
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @winner = nil
    @sum = 0
  end

  def state
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def change_turn
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def question
    number1 = rand(1..10)
    number2 = rand(1..10)
    @sum = number1 + number2
    puts "#{@current_player.name}: What does #{number1} plus #{number2} equal?"
  end

  def is_winner
    if @current_player == @player1
      @winner = @player2
    else 
      @winner = @player1
    end
  end

  def is_number?(number)
    number.to_i.to_s == number
  end


  def main
    while @player1.lives > 0 || @player2.lives > 0 do
      question
      answer = gets.chomp
      is_number?(answer)
      while !is_number?(answer) do
        puts "Please put a NUMBER!!!"
        answer = gets.chomp
      end
      if Integer(answer) == @sum
        puts "Yes! You are Correct."
      else
        @current_player.lose_life
        puts "Seriously? No!"
      end
      puts state
      if @current_player.lives == 0
        is_winner
        puts "#{@winner.name} wins with a score of #{@winner.lives}/3"
        puts "----- GAME OVER -----"
        puts "Goodbye!"
        @player1.reset
        @player2.reset
        break
      end
      change_turn
      puts "------ NEW TURN -------"       
    end
  end
end


player1 = Player.new("Alvin")
player2 = Player.new("Emily") 
game = Game.new(player1,player2)
game.main
