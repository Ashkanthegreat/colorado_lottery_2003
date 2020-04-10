class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = Hash.new
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
   contestant.game_interests.include?(game.name) && contestant.age >= 18
  end

  def can_register?(contestant, game)
    interested_and_18?(contestant, game) && (!contestant.out_of_state? || game.national_drawing?)
  end

  def register_contestant(contestant, game)
    if @registered_contestants[game.name].nil?
      @registered_contestants[game.name] = [contestant]
    else
      @registered_contestants[game.name] << contestant
    end
    # (@registered_contestants[game.name] ||= []) << contestant
  end

  def eligible_contestants(game)
    @registered_contestants[game.name].find_all { |contestant| contestant.spending_money >= game.cost } 
  end




end
