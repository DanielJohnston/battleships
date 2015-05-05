class Board

  def initialize
    @grid = Hash.new
  end

  def place_ship(x, y, length)
    (0..length).each do |i|
      @grid[[x+i, y]] = :ship
    end
  end

  def check_coords(x, y)
    @grid[[x, y]]
  end

end
