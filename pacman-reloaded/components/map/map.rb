class Map
  attr_accessor :walking_matrix, :background

  def initialize(parser, file_name)
    parser.parse file_name
    self.background = parser.background
    self.walking_matrix = parser.walking_matrix
  end

  def walkable?(x, y)
    self.walking_matrix[y][x]
  end
end