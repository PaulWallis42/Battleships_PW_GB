class Game
attr_reader :players, :number_of_players

  def initialize
    @number_of_players = 0
    @players = []
    @ready = false
  end

  def ready?
    @ready = true if (@players.length >= 2)
    @ready
  end

  def over?
  end

  def add_player(player_name)
    fail 'You cannot add more than 2 players!' if (@players.length >= 2)
    @number_of_players+=1
    @players << player_name
  end

  def has_the_turn
    @players[0]
  end

  def switch_turns
    if !!winner
    raise 'the game has ended'
    else
    @players = @players.reverse
    end
  end

  def shoot # (at_coordinate)
    # opponent.receive_shot(at_coordinate)
    switch_turns
  end

  def winner
    return player_two if player_one.lost?
    return player_one if player_two.lost?
    nil
  end

  def player_one
    players.first
  end

  def player_two
    players.last
  end

end
