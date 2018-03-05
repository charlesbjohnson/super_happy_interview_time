# frozen_string_literal: true

module LeetCode
  # 416. Partition Equal Subset Sum
  module LC416
    def partition_recurse(list, target, i, sum, cache)
      return sum == target if i >= list.length
      return false if sum > target

      key_no = [i, sum, :no]
      return cache[key_no] if cache.key?(key_no)
      return true if partition_recurse(list, target, i + 1, sum, cache)
      cache[key_no] = false

      key_yes = [i, sum, :yes]
      return cache[key_yes] if cache.key?(key_yes)
      return true if partition_recurse(list, target, i + 1, sum + list[i], cache)
      cache[key_yes] = false

      false
    end

    # Description:
    # Given a non-empty array containing only positive integers,
    # find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.
    #
    # Examples:
    # - 1:
    #   Input: [1, 5, 11, 5]
    #   Output: true
    #   Explanation: The array can be partitioned as [1, 5, 5] and [11].
    #
    # - 2:
    #   Input: [1, 2, 3, 5]
    #   Output: false
    #
    # Notes:
    # - Each of the array element will not exceed 100.
    # - The array size will not exceed 200.
    #
    # @param list {Array<Integer>}
    # @return {Boolean}
    def partition?(list)
      quotient, remainder = list.sum.divmod(2)
      return false if remainder.positive?
      partition_recurse(list.sort, quotient, 0, 0, {})
    end

    alias can_partition partition?
  end
end
