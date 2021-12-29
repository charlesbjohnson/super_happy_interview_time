# frozen_string_literal: true

module LeetCode
  # 1346. Check If N and Its Double Exist
  module LC1346
    # Description:
    # Given an array arr of integers, check if there exists two integers N and M such that N is the double of M (i.e. N = 2 * M).
    #
    # More formally check if there exists two indices i and j such that:
    # - i != j
    # - 0 <= i, j < arr.length
    # - arr[i] == 2 * arr[j]
    #
    # Examples:
    # Input: arr = [10, 2, 5, 3]
    # Output: true
    #
    # Input: arr = [7, 1, 14, 11]
    # Output: true
    #
    # Input: arr = [3, 1, 7, 11]
    # Output: false
    #
    # @param {Array<Integer>} arr
    # @return {Boolean}
    def check_if_exist(arr)
      seen = Set.new

      arr.each { |v|
        double = v * 2
        return true if seen.include?(double)

        half, remainder = v.divmod(2)
        return true if remainder == 0 && seen.include?(half)

        seen.add(v)
      }

      false
    end
  end
end
