require 'capybara/rspec'

feature 'as a player playing the game' do

  scenario 'fire at board location, return type of hit' do

    board = Board.new(15, 15)
    board.place_ship(2, 2, 3, :right)

    # Fire at a blank co-ordinate, return :miss
    expect(board.fire_at(1,2)).to eq(:miss)
    # Fire at a ship-containing co-ordinate, return :hit
    expect(board.fire_at(4,2)).to eq(:hit)

  end

  #This tests winning. There is no equivalent for losing
  scenario 'win a game, test via won? method' do
    board = Board.new(15, 15)
    board.place_ship(2, 2, 3, :right)
    board.fire_at(2, 2)
    board.fire_at(3, 2)
    board.fire_at(4, 2)
    expect(board.won?).to be(true)
  end

  scenario 'show (opposition) overview of current board status' do
    board = Board.new(15, 15)
    board.place_ship(2, 2, 3, :right)
    board.fire_at(2, 2)
    board.fire_at(2, 3)
    board.fire_at(14, 14)
    # We're not outputting styled data from the Board class
    expect(board.enemy_status).to eq Hash[ [2, 2]=>:hit, [2, 3]=>:miss, [14, 14]=>:miss ]
  end

end
