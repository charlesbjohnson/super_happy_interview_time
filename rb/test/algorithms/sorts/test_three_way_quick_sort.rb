# frozen_string_literal: true

require("config")
require("algorithms/sorts/three_way_quick_sort")

require_relative("./shared_behavior")

module Algorithms
  module Sorts
    class TestThreeWayQuickSort < Minitest::Test
      include(ThreeWayQuickSort)
      include(SharedBehavior::Immutable)
      include(SharedBehavior::Mutable)
    end
  end
end
