require 'spec_helper'

describe Intersection do
  let(:intersection) { Intersection.new(params) }
  let(:rectangle_a) { intersection.rectangle_a }
  let(:rectangle_b) { intersection.rectangle_b }
  context "yes 1" do
    let(:params) { { xa1: '0.0', ya1: '0.0', xa2: '5.0', ya2: '5.0',
                     xb1: '1.0', yb1: '1.0', xb2: '4.0', yb2: '4.0' } }
    specify { expect(intersection.create_arr).to eq \
      [
        [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5]],
        [[1, 1], [1, 2], [1, 3], [1, 4], [2, 1], [2, 2], [2, 3], [2, 4], [3, 1], [3, 2], [3, 3], [3, 4], [4, 1], [4, 2], [4, 3], [4, 4]]
      ]
    }
    specify { expect(rectangle_a.same_size?(rectangle_b)).to be_false }
    specify { expect(intersection.included?).to be_true }
  end
  context "yes 2" do
    let(:params) { { xa1: '0.0', ya1: '0.0', xa2: '4.0', ya2: '5.0',
                     xb1: '1.0', yb1: '1.0', xb2: '5.0', yb2: '5.0' } }
    specify { expect(rectangle_a.same_size?(rectangle_b)).to be_false }
    specify { expect(intersection.included?).to be_true }
  end
  context "no" do
    let(:params) { { xa1: '0.0', ya1: '0.0', xa2: '4.0', ya2: '4.0',
                     xb1: '-3.0', yb1: '-5.0', xb2: '2.0', yb2: '-1.0' } }
    specify { expect(rectangle_a.same_size?(rectangle_b)).to be_false }
    specify { expect(intersection.included?).to be_false }
  end
  context "No since they are the same size" do
    let(:params) { { xa1: '1.0', ya1: '1.0', xa2: '2.0', ya2: '3.0',
                     xb1: '2.0', yb1: '1.0', xb2: '4.0', yb2: '2.0' } }
    specify { expect(rectangle_a.same_size?(rectangle_b)).to be_true }
    specify { expect(intersection.included?).to be_false }
  end
  context "one rectangle in another" do
    let(:params) { { xa1: '0.0', ya1: '0.0', xa2: '4.0', ya2: '4.0',
                     xb1: '-2.0', yb1: '-2.0', xb2: '6.0', yb2: '5.0' } }
    specify { expect(intersection.included?).to be_true }
  end
  context "Unidentified coordinate is in another" do
    let(:params) { { xa1: '0.0', ya1: '0.0', xa2: '4.0', ya2: '4.0',
                     xb1: '2.0', yb1: '-5.0', xb2: '10.0', yb2: '2.0' } }
    specify { expect(intersection.included?).to be_true }
  end
end
