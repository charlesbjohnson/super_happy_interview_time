# frozen_string_literal: true

require("config")
require("algorithms/sorts/heap_sort")

require_relative("./shared_behavior")

module Algorithms
  module Sorts
    class TestHeapSort < Minitest::Test
      include(HeapSort)
      include(SharedBehavior::Immutable)
      include(SharedBehavior::Mutable)
    end
  end
end
