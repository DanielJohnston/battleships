class Board

  def initialize(width=15, height=15)
    @grid = Hash.new
    @width = width
    @height = height
  end

  def place_ship(x, y, length, direction)

    fail 'Off the board!' if x<0 || y<0

    if direction == :right
      # Check that the proposed squares are available
      fail 'Off the board!' if y > @height
      fail 'Off the board!' if x+length > @width
      (0..length-1).each do |i|
        fail 'Overlap!' if @grid[[x+i, y]] == :ship
      end
      # Place ship in each of the proposed squares
      (0..length-1).each do |i|
        @grid[[x+i, y]] = :ship
      end
    elsif direction == :down
      # Check that the proposed squares are available
      fail 'Off the board!' if x > @width
      fail 'Off the board!' if y+length > @height
      (0..length-1).each do |i|
        fail 'Overlap!' if @grid[[x, y+i]] == :ship
      end
      # Place ship in each of the proposed squares
      (0..length-1).each do |i|
        @grid[[x, y+i]] = :ship
      end
    end
  end

  def check_coords(x, y)
    @grid[[x, y]]
  end

end
