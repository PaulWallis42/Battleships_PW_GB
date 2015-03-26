require 'game'

describe Game do

  it 'When created is not ready' do
  expect(subject).not_to be_ready
end

  it 'When created is not over' do
  expect(subject).not_to be_over
end

  it 'When created has no players' do
  expect(subject.number_of_players).to eq (0)
end

  it 'Can add the first player' do
  subject.add_player(:player1)
  expect(subject.number_of_players).to eq 1
  expect(subject.players_1_and_2).to eq [:player1]
  
  end

  it 'Can add the second player' do
  # no need to extra methods to add in class in this one.
  subject.add_player(:player1)
  subject.add_player(:player2)
  expect(subject.number_of_players).to eq 2
  expect(subject.players_1_and_2).to eq [:player1, :player2]
  end

  xit 'Cannot add more than two players' do
  
  end

  xit 'Is ready to start when it has two players' do
  
  end

    xit 'Knows that player one has the turn' do
  
  end

    xit 'Can switch turns' do
  
  end

    xit 'Knows that player two has the turn after switching turns' do
  
  end

    xit 'Knows the current player' do
  
  end

    xit 'Knows the opponent' do
  
  end

    xit 'It takes turns to shoot and shoots at the opponents board' do
  
  end

    xit 'It knows the winner' do
  
  end

    xit 'Cannot switch turns if there is a winner' do
  
  end
end
# 
#
# Player -  Give him a board
#           Place a ship
# Add the player to the game
