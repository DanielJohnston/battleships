require 'capybara/rspec'

feature 'as a player preparing for the game' do
  scenario 'place a ship on the board' do
    board = Board.new
    board.place_ship(2, 2)
    expect(board.check_coords(2,2)).to eq(:ship)
  end
end
