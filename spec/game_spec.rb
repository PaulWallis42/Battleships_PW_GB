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
  expect(subject.players).to eq [:player1]

  end

  it 'Can add the second player' do
  # no need to extra methods to add in class in this one.
  subject.add_player(:player1)
  subject.add_player(:player2)
  expect(subject.number_of_players).to eq 2
  expect(subject.players).to eq [:player1, :player2]
  end

  it 'Cannot add more than two players' do
  subject.add_player(:player1)
  subject.add_player(:player2)
  expect { subject.add_player(:player3) }.to raise_error 'You cannot add more than 2 players!'
  end

  it 'Is ready to start when it has two players' do
  subject.add_player(:player1)
  subject.add_player(:player2)
  expect(subject.ready?).to eq true
  end

  it 'Knows that player one has the turn' do
    subject.add_player(:player1)
    subject.add_player(:player2)
    expect(subject.has_the_turn).to eq :player1
  end

  it 'Can switch turns' do
    expect(subject).to respond_to :switch_turns

  end

  it 'Knows that player two has the turn after switching turns' do
    subject.add_player(:player1)
    subject.add_player(:player2)
    subject.switch_turns
    expect(subject.has_the_turn).to eq :player2
  end

  it 'Knows the current player' do
    subject.add_player(:player1)
    subject.add_player(:player2)
    10.times { subject.switch_turns }
    expect(subject.has_the_turn).to eq :player1
  end

  xit 'Knows the opponent' do
    # known from previous test
  end

  it 'It takes turns to shoot' do
    subject.add_player(:player1)
    subject.add_player(:player2) 
    subject.has_the_turn
    expect(subject.has_the_turn).to eq :player1
    subject.shoot
    expect(subject.has_the_turn).to eq :player2

  end

  it 'It shoots at the opponents board' do
    board = double ('board')
    subject.add_player(:player1)
    allow(board).to receive(:shoot)
    expect(board).to respond_to(:shoot)
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
