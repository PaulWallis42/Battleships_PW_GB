require 'game'

describe Game do

  it 'When created is not ready'do
  expect(subject).not_to be_ready
end

  it 'When created is not over' do
  expect(subject).not_to be_over
end

  it 'When created has no players' do
  expect(subject.number_of_players).to eq (0)
end

end


# When created has no players
#
# Can add the first player
# Can add the second player
# Cannot add more than two players
# Is ready to start when it has two players
# Knows that player one has the turn
# Can switch turns
# Knows that player two has the turn after switching turns
# Knows the current player
# Knows the opponent
# It takes turns to shoot and shoots at the opponents board
# It knows the winner
# Cannot switch turns if there is a winner
#
# Player -  Give him a board
#           Place a ship
# Add the player to the game
