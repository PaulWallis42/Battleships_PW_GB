class Game

  def initialize
    @number_of_players = 0
    @players_1_and_2 = []
    @ready = false
  end

  def ready?
    @ready = true if (@players_1_and_2.length >= 2)
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
    fail 'You cannot add more than 2 players!' if (@players_1_and_2.length >= 2)
    @number_of_players+=1
    @players_1_and_2 << player_name
  end

end
