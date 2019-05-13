# frozen_string_literal: true

require 'config'
require 'algorithms/sorting/heap_sort'

require_relative './shared_sorting_behavior'

module Algorithms
  module Sorting
    class TestHeapSort < Minitest::Test
      include HeapSort
      include SharedSortingBehavior::Immutable
      include SharedSortingBehavior::Mutable
    end
  end
end
