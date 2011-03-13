class Game
  MAX_FRAMES = 10
  
  def initialize
    @rolls = []
  end
  
  def roll pins
    @rolls << pins
  end
  
  def score
    game_score = 0
    @roll_index = 0
    MAX_FRAMES.times do |frame_index|
      if first_roll ==10
        game_score += 10 + strike_bonus
        @roll_index += 1
      elsif is_spare?
        game_score += 10 + spare_bonus
        @roll_index += 2
      else 
        game_score += first_roll + second_roll
        @roll_index += 2
      end

    end
    
    game_score
  end
  
  private
  
  def is_spare?
    return first_roll + second_roll == 10
  end
  
  def first_roll
    @rolls[@roll_index]
  end
  
  def second_roll
    @rolls[@roll_index+1]
  end
  
  def spare_bonus
    @rolls[@roll_index+2]
  end
  
  def strike_bonus
    @rolls[@roll_index+1] + @rolls[@roll_index+2]
  end
end