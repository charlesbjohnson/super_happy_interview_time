# frozen_string_literal: true

require("config")
require("algorithms/sorts/bottom_up_merge_sort")

require_relative("./shared_behavior")

module Algorithms
  module Sorts
    class TestBottomUpMergeSort < Minitest::Test
      include(BottomUpMergeSort)
      include(SharedBehavior::Immutable)
      include(SharedBehavior::Mutable)
    end
  end
end
