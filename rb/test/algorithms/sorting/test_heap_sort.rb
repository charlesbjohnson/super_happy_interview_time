# frozen_string_literal: true

require 'config'
require_relative 'shared_sorting_behavior'

module Algorithms
  module Sorting
    class TestHeapSort < Minitest::Test
      include HeapSort
      include SharedSortingBehavior::Immutable
      include SharedSortingBehavior::Mutable
    end
  end
end
