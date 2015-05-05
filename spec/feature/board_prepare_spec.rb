require 'capybara/rspec'

feature 'as a player preparing for the game' do
  scenario 'place two ships on the board in different directions' do

    board = Board.new

    board.place_ship(2, 2, 3, :right)
    (2..4).each do |index|
      expect(board.check_coords(index,2)).to eq(:ship)
    end

    board.place_ship(3, 3, 4, :down)
    (3..6).each do |index|
      expect(board.check_coords(3, index)).to eq(:ship)
    end

  end
end
