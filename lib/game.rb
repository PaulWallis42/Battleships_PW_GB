class Game

  def initialize
    @number_of_players = 0
    @players_1_and_2 = []
  end

  def ready?
  end

  def over?
  end

  def number_of_players
    @number_of_players
  end

  def players_1_and_2
    @players_1_and_2
  end

  def add_player(player_name)
    @number_of_players+=1
    @players_1_and_2 << player_name
  end

end
