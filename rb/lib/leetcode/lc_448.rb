# frozen_string_literal: true

module LeetCode
  # 448. Find All Numbers Disappeared in an Array
  module LC448
    # Description:
    # Given an array of integers where 1 <= a[i] <= n (n = size of array), some elements appear twice and others appear once.
    # Find all the elements of [1, n] inclusive that do not appear in this array.
    #
    # Examples:
    # Input: [4, 3, 2, 7, 8, 2, 3, 1]
    # Output: [5, 6]
    #
    # Notes:
    # - Could you do it without extra space and in O(n) runtime?
    # - You may assume the returned list does not count as extra space.
    #
    # @param list {Array<Integer>}
    # @return {Array<Integer>}
    def find_disappeared_numbers(list)
      return [] if list.empty?

      cursor = 0

      while cursor < list.length
        value = list[cursor]

        if !value || value - 1 == cursor
          cursor += 1
          next
        end

        if list[value - 1] == value
          list[cursor] = nil
          cursor += 1
          next
        end

        list[cursor] = list[value - 1]
        list[value - 1] = value
      end

      list.each.with_index
          .select { |v, _i| v.nil? }
          .map { |_, i| i + 1 }
    end
  end
end
