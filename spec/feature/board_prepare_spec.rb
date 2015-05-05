require 'capybara/rspec'

feature 'as a player preparing for the game' do
  scenario 'place a ship of length 3 on the board' do
    board = Board.new
    board.place_ship(2, 2, 3)
    (2..4).each do |index|
      expect(board.check_coords(index,2)).to eq(:ship)
    end
    
  end
end
