# frozen_string_literal: true

module LeetCode
  # 167. Two Sum II - Input Array Is Sorted
  module LC167
    # Description:
    # Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order,
    # find two numbers such that they add up to a specific target number.
    # Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.
    #
    # Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.
    #
    # Examples:
    # Input: numbers = [2, 7, 11, 15], target = 9
    # Output: [1, 2]
    #
    # Input: numbers = [2, 3, 4], target = 6
    # Output: [1, 3]
    #
    # Input: numbers = [-1, 0], target = -1
    # Output: [1, 2]
    #
    # @param {Array<Integer>} numbers
    # @param {Integer} target
    # @return {Array(Integer, Integer)}
    def two_sum(numbers, target)
      i = 0
      j = numbers.length - 1

      while i < j
        found = numbers[i] + numbers[j]

        if found == target
          break
        elsif found < target
          i += 1
        else
          j -= 1
        end
      end

      [i + 1, j + 1]
    end
  end
end
