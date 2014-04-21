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
    @inside_points ||= (x1..x2).to_a.product((y1..y2).to_a)
  end

  def edge_points
    [[x1, y1], [x2, y2], [x1, y2], [x2, y1]]
  end

  def included?(other)
    (include_any_point?(other) || other.include_any_point?(self)) && !same_size?(other)
  end

  def include_any_point?(other)
    edge_points.any?{|point| other.include_this_point? point}
  end

  def include_this_point?(point)
    inside_points.include? point
  end
end


##
# Find at least one of four coordinates are part of another recangle coordinates.
class Intersection
  attr_reader :rectangle_a, :rectangle_b

  ##
  # may be I can use def initialize and use @xa1 = xa1
  def initialize(params)
    params_a, params_b = %i(xa1 ya1 xa2 ya2 xb1 yb1 xb2 yb2).map{|key| params[key].to_i}.each_slice(4).to_a
    @rectangle_a = Rectangle.new(*params_a)
    @rectangle_b = Rectangle.new(*params_b)
  end

  ##
  # Check if four coordinates are included in other array
  def included?
    rectangle_a.included?(rectangle_b)
  end
end
