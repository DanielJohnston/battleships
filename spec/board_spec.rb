require 'board'

describe Board do

  #confirm that a ship that has been placed is now in place
  it 'retains a ship that has been placed on it' do
    board = Board.new
    board.place_ship(2, 2)
    expect(board.check_coords(2,2)).to eq(:ship)
  end

end
