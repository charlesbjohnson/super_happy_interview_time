# frozen_string_literal: true

module LeetCode
  # 215. Kth Largest Element in an Array
  module LC215
    Heap = Helpers::LeetCode::Heap

    # Description:
    # Given an integer array nums and an integer k, return the kth largest element in the array.
    #
    # Note that it is the kth largest element in the sorted order, not the kth distinct element.
    #
    # Examples:
    # Input: nums = [3, 2, 1, 5, 6, 4], k = 2
    # Output: 5
    #
    # Input: nums = [3, 2, 3, 1, 2, 4, 5, 5, 6], k = 4
    # Output: 4
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {Integer}
    def find_kth_largest(nums, k)
      result = private_methods.grep(/^find_kth_largest_\d+$/).map { |m| send(m, nums, k) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def find_kth_largest_1(nums, k)
      nums.sort.reverse[k - 1]
    end

    def find_kth_largest_2(nums, k)
      heap = Heap.new

      nums.each { |num|
        case heap.size
        when ...k
          heap.push(num)
        when k
          if num > heap.peek
            heap.push(num)
            heap.pop
          end
        end
      }

      heap.pop
    end
  end
end
