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
    expect { subject.place_ship(13, 10, 3, :right) }.to raise_error 'Off the board!'
  end

  it 'raises error when placing ships on top of each other' do
    subject.place_ship(5, 5, 5, :down)
    expect { subject.place_ship(2, 8, 4, :right) }.to raise_error 'Overlap!'
  end

  it 'returns :miss when firing at a co-ordinate with no ship on it' do
    subject.place_ship(2, 2, 3, :right)
    # Fire at a blank co-ordinate, return :miss
    expect(subject.fire_at(1,2)).to eq(:miss)
  end

  it 'returns :hit when firing at a co-ordinate with a ship on it' do
    subject.place_ship(2, 2, 3, :right)
    # Fire at a ship-containing co-ordinate, return :hit
    expect(subject.fire_at(4,2)).to eq(:hit)
  end

  it 'returns .won == true when all ships sunk on a board' do
    subject.place_ship(2, 2, 3, :right)
    subject.fire_at(2, 2)
    subject.fire_at(3, 2)
    subject.fire_at(4, 2)
    expect(subject.won?).to be(true)
  end

  it 'returns in-game board info as viewed by an enemy' do
    subject.place_ship(2, 2, 3, :right)
    subject.fire_at(2, 2)
    subject.fire_at(2, 3)
    subject.fire_at(14, 14)
    # We're not outputting styled data from the Board class
    expect(subject.enemy_status).to eq Hash[ [2, 2]=>:hit, [2, 3]=>:miss, [14, 14]=>:miss ]
  end


end
