# frozen_string_literal: true

require("config")
require("algorithms/sorts/top_down_merge_sort")

require_relative("./shared_behavior")

module Algorithms
  module Sorts
    class TestTopDownMergeSort < Minitest::Test
      include(TopDownMergeSort)
      include(SharedBehavior::Immutable)
      include(SharedBehavior::Mutable)
    end
  end
end
