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


feature 'as two players playing a game' do

  scenario 'create two boards, set up ships, take shots and view own and enemy status' do

    player1 = Player.new
    player2 = Player.new

    player1.board.place_ship(1,1,player1.ships[0],:right)
    player1.board.place_ship(2,2,player1.ships[1],:down)  

    player2.board.place_ship(3,3,player2.ships[4],:right)
    player2.board.place_ship(4,4,player2.ships[5],:down)

    player1.board.fire_at(1,1)
    player1.board.fire_at(3,3)

    player2.board.fire_at(2,2)
    player2.board.fire_at(4,4)

    expect(player1.board.enemy_status).to eq {ABOUT TWO THINGS}
    expect(player1.board.friend_status).to eq {SOMETHING HUGE}

    expect(player2.board.enemy_status).to eq {TWO THINGS}
    expect(player2.board.friend_status).to eq {SOMETHING HUGE}


  end

end
