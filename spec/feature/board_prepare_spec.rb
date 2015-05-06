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

  scenario 'placing ships outside of the board produces error' do

    board = Board.new(20,20)

    expect { board.place_ship(18, 10 , 5, :right) }.to raise_error 'Off the board!'
    expect { board.place_ship(3, 16 , 5, :down) }.to raise_error 'Off the board!'
    expect { board.place_ship(-3, 5, 5, :right) }.to raise_error 'Off the board!'
    expect { board.place_ship(3, 15, 5, :down) }.not_to raise_error
    expect { board.place_ship(18, 10, 2, :right) }.not_to raise_error
    expect { board.place_ship(0, 0, 5, :right) }.not_to raise_error

  end

  scenario 'placing ships on top of each other produces error' do

    board = Board.new(20,20)

    board.place_ship(5, 5, 5, :down)
    expect { board.place_ship(2, 8, 4, :right) }.to raise_error 'Overlap!'

  end

end
