class Player
  attr_reader :lives
  attr_accessor :name, :current_player, :lives
  def initialize(name)
    @lives = 3
    @name = name
    @alive = true
  end

  def lose_life
    @lives -= 1
  end

  def reset
    @lives = 3
    @alive = true
  end
end