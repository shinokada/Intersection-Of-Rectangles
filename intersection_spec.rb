require './spec_helper'
require './intersection.rb'

describe Intersection do
  before do
    # YES
    @xa1 = 0.0
    @ya1 = 0.0
    @xa2 = 5.0
    @ya2 = 5.0
    @xb1 = 1.0 
    @yb1 = 1.0
    @xb2 = 4.0
    @yb2 = 4.0

    # YES
    @xa3 = 0.0
    @ya3 = 0.0
    @xa4 = 4.0
    @ya4 = 5.0
    @xb3 = 1.0 
    @yb3 = 1.0
    @xb4 = 5.0
    @yb4 = 5.0

    # NO
    @xa5 = 0.0
    @ya5 = 0.0
    @xa6 = 4.0
    @ya6 = 4.0
    @xb5 = -3.0 
    @yb5 = -5.0
    @xb6 = 2.0
    @yb6 = -1.0

    #YES
    @xa7 = 1.0
    @ya7 = 1.0
    @xa8 = 2.0
    @xa8 = 3.0
    @xb7 = 2.0
    @yb7 = 1.0
    @xb8 = 4.0
    @yb8 = 2.0
  end
  
  specify{ expect(Intersection.create_arr(@xa1, @ya1, @xa2, @ya2)).to eq [[0,0], [0,1], [0,2], [0,3], [0,4], [0,5], [1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [2,0], [2,1], [2,2], [2,3], [2,4], [2,5], [3,0], [3,1], [3,2], [3,3], [3,4], [3,5], [4,0], [4,1], [4,2], [4,3], [4,4], [4,5], [5,0], [5,1], [5,2], [5,3], [5,4], [5,5]] }

  specify{ expect(Intersection.included?(@xa1, @ya1, @xa2, @ya2, @xb1, @yb1, @xb2, @yb2)). to eq true }
  specify{ expect(Intersection.included?(@xa3, @ya3, @xa4, @ya4, @xb3, @yb3, @xb4, @yb4)). to eq true }
  specify{ expect(Intersection.included?(@xa5, @ya5, @xa6, @ya6, @xb5, @yb5, @xb6, @yb6)). to eq false }
              
  specify{ expect(Intersection.check_size?(@xa7, @ya7, @xa8, @ya8, @xa7, @ya7, @xa8, @ya8)). to eq true }
  specify{ expect(Intersection.check_size?(@xa7, @ya7, @xa8, @ya8, @xb7, @yb7, @xb8, @yb8)). to eq true }
end

