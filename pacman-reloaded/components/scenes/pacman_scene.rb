require 'java'
java_import Java::com.uqbar.vainilla.GameScene
java_import Java::extensions.shapes.Circle
java_import Java::java.awt.Color

require_relative '../components/pacman_component'
require_relative '../components/board'


class PacmanScene < GameScene
  attr_accessor :walkable_matrix, :pacman, :points, :lifes, :foods

  def initialize
    super
    self.points = Board.new 35, 0, Color::BLACK
    self.lifes = Board.new 0, 0, Color::BLACK
  end

  def takeStep(graphics)
    super graphics
    Array.new(foods).each do |food|
      if food.shape.colliding? pacman.shape
        food.eaten
        foods.delete food
      end
    end
  end

  def onSetAsCurrent
    add_component points
    add_component lifes
    super
  end

  def can_walk(x, y)
    row = walkable_matrix[y]
    if row
      row[x] == true || row[x].nil?
    else
      true
    end
  end

  def can_occupy?(x, y, circle)
    can_walk to_b(x), to_b(y) and
        can_walk to_b(x + circle.diameter), to_b(y) and
        can_walk to_b(x), to_b(y + circle.diameter) and
        can_walk to_b(x + circle.diameter), to_b(y + circle.diameter)

  end

  def to_b(x)
    (x / block_size).to_i
  end

  def block_size
    game.block_size
  end

end
