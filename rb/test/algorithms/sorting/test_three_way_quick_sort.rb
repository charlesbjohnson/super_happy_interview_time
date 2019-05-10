# frozen_string_literal: true

require 'config'
require_relative 'shared_sorting_behavior'

module Algorithms
  module Sorting
    class TestThreeWayQuickSort < Minitest::Test
      include ThreeWayQuickSort
      include SharedSortingBehavior::Immutable
      include SharedSortingBehavior::Mutable
    end
  end
end
