# frozen_string_literal: true

require("config")
require("algorithms/sorting/bottom_up_merge_sort")

require_relative("./shared_sorting_behavior")

module Algorithms
  module Sorting
    class TestBottomUpMergeSort < Minitest::Test
      include(BottomUpMergeSort)
      include(SharedSortingBehavior::Immutable)
      include(SharedSortingBehavior::Mutable)
    end
  end
end
