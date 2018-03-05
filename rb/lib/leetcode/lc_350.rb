# frozen_string_literal: true

module LeetCode
  # 350. Intersection of Two Arrays II
  module LC350
    # Description:
    # Given two arrays, write a function to compute their intersection.
    #
    # Examples:
    # Input: left = [1, 2, 2, 1], right = [2, 2]
    # Output: [2, 2]
    #
    # Notes:
    # - Each element in the result should appear as many times as it shows in both arrays.
    # - The result can be in any order.
    #
    # - What if the given array is already sorted? How would you optimize your algorithm?
    # - What if left's size is small compared to right's size? Which algorithm is better?
    # - What if elements of right are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
    #
    # @param left {Array<Integer>}
    # @param right {Array<Integer>}
    # @return {Array<Integer>}
    def intersect(left, right)
      left = left.each.with_object(Hash.new(0)) { |n, counts| counts[n] += 1 }
      right.each.with_object([]) do |n, intersection|
        if left[n].positive?
          left[n] -= 1
          intersection.push(n)
        end
      end
    end
  end
end
