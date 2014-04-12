class Intersection

  # compare sizes 
  # both can't have the same size
  def self.check_size?(xa1, ya1, xa2, ya2, xb1, yb1, xb2, yb2)
    rec1 = [(xa2.to_i-xa1.to_i).abs, (ya2.to_i-ya1.to_i).abs]
    rec2 = [(xb2.to_i-xb1.to_i).abs, (yb2.to_i-yb1.to_i).abs]
    rec1 == rec2 or rec1 == rec2.reverse
    # rec1<<rec2.reverse
  end

  def self.create_arr(xa1, ya1, xa2, ya2)
    ((xa1.to_i)..(xa2.to_i)).to_a.product(((ya1.to_i)..(ya2.to_i)).to_a)
  end

  def self.included?(xa1, ya1, xa2, ya2, xb1, yb1, xb2, yb2)
    if !check_size?(xa1, ya1, xa2, ya2, xb1, yb1, xb2, yb2)
      create_arr = ((xa1.to_i)..(xa2.to_i)).to_a.product(((ya1.to_i)..(ya2.to_i)).to_a)
      create_arr.include?([xb1, yb1]) || create_arr.include?([xb2,yb2])
    end
  end


end
