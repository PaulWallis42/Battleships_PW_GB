class Game

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

  def number_of_players
    @number_of_players
  end

  def players
    @players
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
    @players = @players.reverse
  end

  def shoot
    switch_turns
    'Boom'
  end
end
