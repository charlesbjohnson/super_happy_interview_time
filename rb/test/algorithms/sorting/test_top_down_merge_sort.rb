# typed: strong
# frozen_string_literal: true

require 'config'
require 'algorithms/sorting/top_down_merge_sort'

require_relative './shared_sorting_behavior'

module Algorithms
  module Sorting
    class TestTopDownMergeSort < Minitest::Test
      include TopDownMergeSort
      include SharedSortingBehavior::Immutable
      include SharedSortingBehavior::Mutable
    end
  end
end
