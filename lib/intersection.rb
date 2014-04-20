class Rectangle
  attr_reader :x1, :y1, :x2, :y2

  def initialize(x1, y1, x2, y2)
    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2
  end

  def rec
    [(x2 - x1).abs, (y2 - y1).abs]
  end

  def same_size?(other)
    rec == other.rec or rec == other.rec.reverse
  end

  def inside_points
    (x1..x2).to_a.product((y1..y2).to_a)
  end

  def edge_points
    [[x1, y1], [x2, y2], [x1, y2], [x2, y1]]
  end

  def include?(other)
    edge_points.any?{|point| other.include_this_point? point} && !same_size?(other)
  end

  def include_this_point?(point)
    inside_points.include? point
  end
end


##
# Find at least one of four coordinates are part of another recangle coordinates.
class Intersection
  ##
  # may be I can use def initialize and use @xa1 = xa1
  def initialize(params)
    @a = Rectangle.new(params[:xa1].to_i, params[:ya1].to_i, params[:xa2].to_i, params[:ya2].to_i)
    @b = Rectangle.new(params[:xb1].to_i, params[:yb1].to_i, params[:xb2].to_i, params[:yb2].to_i)
  end

  ##
  # compare sizes
  # both can't have the same size
  def same_size?
    @a.same_size?(@b)
  end

  ##
  # Create array for all integer coordinate within a rectangle
  def create_arr
    [@a.inside_points, @b.inside_points]
  end

  ##
  # Check if four coordinates are included in other array
  def included?
    first_arr, second_arr  = create_arr
    @b.include?(@a) || @a.include?(@b)
  end
end
