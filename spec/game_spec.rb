require 'game'

describe Game do
let(:player1) { double :player }
let(:player2) { double :player }

  context 'before players join' do

    it 'When created is not ready' do
      expect(subject).not_to be_ready
    end

    it 'When created is not over' do
      expect(subject).not_to be_over
    end

    it 'When created has no players' do
      expect(subject.number_of_players).to eq (0)
    end  
  end

  context '1 player join the game' do
    it 'Can add the first player' do
      subject.add_player(player1)
      expect(subject.number_of_players).to eq 1
      expect(subject.players).to eq [player1]
    end
  end

  context '2 players joining and play the game' do

    before do
      subject.add_player(player1)
      subject.add_player(player2)
      allow(player1).to receive(:lost?).and_return false
      allow(player2).to receive(:lost?).and_return false      
    end

    it 'Can add the second player' do
      # no need to extra methods to add in class in this one.
      expect(subject.number_of_players).to eq 2
      expect(subject.players).to eq [player1, player2]
    end

    it 'Cannot add more than two players' do
      expect { subject.add_player(:player3) }.to raise_error 'You cannot add more than 2 players!'
    end

    it 'Is ready to start when it has two players' do
      expect(subject.ready?).to eq true
    end

    it 'Knows that player one has the turn' do
      expect(subject.has_the_turn).to eq player1
    end

    it 'Can switch turns' do
      expect(subject).to respond_to :switch_turns
    end

    it 'Knows that player two has the turn after switching turns' do
      subject.switch_turns
      expect(subject.has_the_turn).to eq player2
    end

    it 'Knows the current player' do
      10.times { subject.switch_turns }
      expect(subject.has_the_turn).to eq player1
    end

    xit 'Knows the opponent' do
      # known from previous test
    end

    it 'It takes turns to shoot' do
      subject.has_the_turn
      expect(subject.has_the_turn).to eq player1
      subject.shoot
      expect(subject.has_the_turn).to eq player2
    end

    it 'It shoots at the opponents board' do
      board = double ('board')
      allow(board).to receive(:shoot)
      expect(board).to respond_to(:shoot)
    end
  end

  context 'one of the players win' do

    it 'It knows the winner' do
      player1_loses = double 'Player1', lost?: true
      player2_wins = double 'Player2', lost?: false
      subject.add_player(player1_loses)
      subject.add_player(player2_wins)
      expect(subject.winner).to equal player2_wins
    end

    it 'Cannot switch turns if there is a winner' do
      player1_loses = double 'Player1', lost?: true
      player2_wins = double 'Player2', lost?: false
      subject.add_player(player1_loses)
      subject.add_player(player2_wins)
      allow(player1_loses).to receive(:lost?).and_return true
      allow(player2_wins).to receive(:lost?).and_return false
      subject.winner
      expect{subject.switch_turns}.to raise_error 'the game has ended'
    end
  end
end
#
#
# Player -  Give him a board
#           Place a ship
# Add the player to the game
