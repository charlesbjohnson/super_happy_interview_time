# typed: true
# frozen_string_literal: true

module LeetCode
  # 169. Majority Element
  module LC169
    # Description:
    # Given an array of size n, find the majority element. The majority element is the element that appears more than n / 2 times.
    # You may assume that the array is non-empty and the majority element always exist in the array.
    #
    # @param list {Array<Integer>}
    # @return {Integer}
    def majority_element(list)
      list.sort[list.length / 2]
    end
  end
end
