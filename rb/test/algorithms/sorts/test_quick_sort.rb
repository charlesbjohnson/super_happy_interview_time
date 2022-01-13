# frozen_string_literal: true

require("config")
require("algorithms/sorts/quick_sort")

require_relative("./shared_behavior")

module Algorithms
  module Sorts
    class TestQuickSort < Minitest::Test
      include(QuickSort)
      include(SharedBehavior::Immutable)
      include(SharedBehavior::Mutable)
    end
  end
end
