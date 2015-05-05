require 'board'

describe Board do
  let(:board) { Board.new(15, 15) }

  #confirm that a ship that has been placed is now in place
  it 'retains a ship that has been placed on it' do
    subject.place_ship(2, 2, 3, :right)
    (0..2).each do |index|
      expect(subject.check_coords(2+index, 2)).to eq(:ship)
    end
  end

  it 'allows a ship to be placed vertically' do
    subject.place_ship(3, 3, 4, :down)
    (3..6).each do |index|
      expect(subject.check_coords(3,index)).to eq(:ship)
    end
  end

  it 'raises error when placing a ship out of bounds' do
    #This is *very* reliant on the default sizes set in let statement above
    expect { subject.place_ship(13, 10, 5, :right) }.to raise_error 'Off the board!'
  end

end
