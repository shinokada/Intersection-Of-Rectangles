require 'spec_helper'

describe Intersection do
  before do
    # YES
    param1 = { xa1: '0.0', ya1: '0.0', xa2: '5.0', ya2: '5.0', xb1: '1.0', yb1: '1.0', xb2: '4.0', yb2: '4.0' }

    # YES
    param2 = { xa1: '0.0', ya1: '0.0', xa2: '4.0', ya2: '5.0', xb1: '1.0', yb1: '1.0', xb2: '5.0', yb2: '5.0' }

    # NO
    param3 = { xa1: '0.0', ya1: '0.0', xa2: '4.0', ya2: '4.0', xb1: '-3.0', yb1: '-5.0', xb2: '2.0', yb2: '-1.0' }

    # No since they are the same size
    param4 = { xa1: '1.0', ya1: '1.0', xa2: '2.0', ya2: '3.0', xb1: '2.0', yb1: '1.0', xb2: '4.0', yb2: '2.0' }
 
    # one rectangle in another
    param5 = { xa1: '0.0', ya1: '0.0', xa2: '4.0', ya2: '4.0', xb1: '-2.0', yb1: '-2.0', xb2: '6.0', yb2: '5.0' }

    # Unidentified coordinate is in another
    param6 = { xa1: '0.0', ya1: '0.0', xa2: '4.0', ya2: '4.0', xb1: '2.0', yb1: '-5.0', xb2: '10.0', yb2: '2.0' }
    @intersection = Intersection.new(param1)
    @intersection2 = Intersection.new(param2)
    @intersection3 = Intersection.new(param3)
    @intersection4 = Intersection.new(param4)
    @intersection5 = Intersection.new(param5)
    @intersection6 = Intersection.new(param6)
  end
  
  specify { expect(@intersection.create_arr).to eq  [[[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5]], [[1, 1], [1, 2], [1, 3], [1, 4], [2, 1], [2, 2], [2, 3], [2, 4], [3, 1], [3, 2], [3, 3], [3, 4], [4, 1], [4, 2], [4, 3], [4, 4]]] }
  specify { expect(@intersection.check_size?). to eq false  }
  specify { expect(@intersection2.check_size?). to eq false  }
  specify { expect(@intersection3.check_size?). to eq false  }
  specify { expect(@intersection4.check_size?). to eq true  }
  
  specify { expect(@intersection.included?). to eq true  }
  specify { expect(@intersection2.included?). to eq true  }
  specify { expect(@intersection3.included?). to eq false  }
  specify { expect(@intersection4.included?). to eq false }
  specify { expect(@intersection5.included?). to eq true  }
  specify { expect(@intersection6.included?). to eq true  }
              
end
