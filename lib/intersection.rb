##
# Find at least one of four coordinates are part of another recangle coordinates.
class Intersection
  ##
  # may be I can use def initialize and use @xa1 = xa1
  def initialize(params)
    @xa1 = params[:xa1].to_i
    @ya1 = params[:ya1].to_i
    @xa2 = params[:xa2].to_i
    @ya2 = params[:ya2].to_i
    @xb1 = params[:xb1].to_i
    @yb1 = params[:yb1].to_i
    @xb2 = params[:xb2].to_i
    @yb2 = params[:yb2].to_i
  end

  ##
  # compare sizes
  # both can't have the same size
  def same_size?
    rec1 = [(@xa2 - @xa1).abs, (@ya2 - @ya1).abs]
    rec2 = [(@xb2 - @xb1).abs, (@yb2 - @yb1).abs]
    rec1 == rec2 or rec1 == rec2.reverse
  end

  ##
  # Create array for all integer coordinate within a rectangle
  def create_arr
    [(@xa1..@xa2).to_a.product((@ya1..@ya2).to_a), (@xb1..@xb2).to_a.product((@yb1..@yb2).to_a)]
  end

  ##
  # Check if four coordinates are included in other array
  def included?
    return false if same_size?

    first_arr  = create_arr[0]
    second_arr = create_arr[1]
    first_arr.include?( [@xb1, @yb1]) ||
      first_arr.include?([@xb2, @yb2]) ||
      first_arr.include?([@xb1, @yb2]) ||
      first_arr.include?([@xb2, @yb1]) ||
      second_arr.include?([@xa1, @ya1]) ||
      second_arr.include?([@xa2, @ya2]) ||
      second_arr.include?([@xa1, @ya2]) ||
      second_arr.include?([@xa2, @ya1])
  end
end
