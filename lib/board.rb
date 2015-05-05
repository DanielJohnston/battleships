class Board

  def initialize
    @grid = Hash.new
  end

  def place_ship(x, y, length, direction)
    if direction == :right
      (0..length).each do |i|
        @grid[[x+i, y]] = :ship
      end
    elsif direction == :down
      (0..length).each do |i|
        @grid[[x, y+i]] = :ship
      end
    end
  end

  def check_coords(x, y)
    @grid[[x, y]]
  end

end
