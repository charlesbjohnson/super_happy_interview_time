# typed: true
# frozen_string_literal: true

module LeetCode
  # 15. 3Sum
  module LC15
    # Description:
    # Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0?
    # Find all unique triplets in the array which gives the sum of zero.
    #
    # Examples:
    # Input: [-1, 0, 1, 2, -1, -4],
    # Output: [[-1, 0, 1], [-1, -1, 2]]
    #
    # Notes:
    # - The solution set must not contain duplicate triplets.
    #
    # @param list {Array<Integer>}
    # @return {Array<Array<Integer>>}
    def three_sum(list)
      list = list.sort
      sets = []

      left_bound = 0
      right_bound = list.length - 1

      # exclude large numbers that cannot be counterbalanced by
      # numbers on the other side of the spectrum
      while left_bound < right_bound
        if list[left_bound].abs > (list[right_bound] * 2)
          left_bound += 1
          next
        end

        if list[right_bound] > (list[left_bound].abs * 2)
          right_bound -= 1
          next
        end

        break
      end

      return sets if (right_bound - left_bound) < 2
      return sets if list[left_bound].positive?

      left = left_bound
      while left < (right_bound - 1)
        # exclude number that was seen before
        if left > left_bound && list[left] == list[left - 1]
          left += 1
          next
        end

        center = left + 1
        right = right_bound

        while center < right
          # exclude number that was seen before
          if center > left + 1 && list[center] == list[center - 1]
            center += 1
            next
          end

          # exclude number that was seen before
          if right < right_bound && list[right] == list[right + 1]
            right -= 1
            next
          end

          sum = list[left] + list[center] + list[right]
          sets.push([list[left], list[center], list[right]]) if sum.zero?

          if sum <= 0
            center += 1
          else
            right -= 1
          end
        end

        left += 1
      end

      sets
    end
  end
end
