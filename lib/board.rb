class Board

  def initialize
    @grid = Hash.new
  end

  def place_ship(x, y)
    @grid[[x, y]] = :ship
  end

  def check_coords(x, y)
    @grid[[x, y]]
  end

end
