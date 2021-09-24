# typed: true
# frozen_string_literal: true

module LeetCode
  # 238. Product of Array Except Self
  module LC238
    # Description:
    # Given an array of n integers where n > 1, list, return an array output such that
    # output[i] is equal to the product of all the elements of list except list[i].
    #
    # Solve it without division and in O(n).
    #
    # Examples:
    # Input: [1, 2, 3, 4]
    # Output: [24, 12, 8, 6]
    #
    # Notes:
    # - Could you solve it with constant space complexity?
    # - The output array does not count as extra space for the purpose of space complexity analysis.
    #
    # @param list {Array<Integer>}
    # @return {Array<Integer>}
    def product_except_self(list)
      result = Array.new(list.length)

      list.each.with_index.reduce(1) { |product, (v, i)|
        result[i] = product
        product * v
      }

      list.reverse_each.with_index.reduce(1) { |product, (v, i)|
        result[list.length - i - 1] *= product
        product * v
      }

      result
    end
  end
end
