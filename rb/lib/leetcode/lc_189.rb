# frozen_string_literal: true

module LeetCode
  # 189. Rotate Array
  module LC189
    # Description:
    # Rotate an array of n elements to the right by k steps.
    #
    # Examples:
    # Input: list = [1, 2, 3, 4, 5, 6, 7], steps = 3
    # Output: nil
    # where list = [5, 6, 7, 1, 2, 3, 4]
    #
    # Notes:
    # - Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
    #
    # @param list {Array<Integer>}
    # @param steps {Integer}
    # @return {nil}
    def rotate(list, steps)
      return if list.length < 2

      steps = steps % list.length
      return if steps < 1

      reverse(list, 0...list.length)
      reverse(list, 0...steps)
      reverse(list, steps...list.length)
    end

    def reverse(list, range)
      left = range.min
      right = range.max

      while left < right
        list[left], list[right] = list[right], list[left]

        left += 1
        right -= 1
      end

      list
    end
  end
end
