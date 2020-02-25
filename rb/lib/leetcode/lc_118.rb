# typed: false
# frozen_string_literal: true

module LeetCode
  # 118. Pascal's Triangle
  module LC118
    # Description:
    # Given n, generate the first n rows of Pascal's triangle.
    #
    # Examples:
    # Given: 5
    # Output: [
    # [1],
    # [1,1],
    # [1,2,1],
    # [1,3,3,1],
    # [1,4,6,4,1],
    # ]

    # @param n {Integer}
    # @return {Array<Array<Integer>>}
    def generate(n)
      return [] if n < 1
      return [[1]] if n == 1

      result = [
        [1],
        [1, 1],
      ]

      return result if n == 2

      (2...n).each do |i|
        prev = result[i - 1]
        current = []

        mid = prev.length / 2
        left = mid
        right = mid

        if prev.length.even?
          left = mid - 1
          right = mid
          current.push(prev[left] + prev[right])
        end

        while left >= 0 && right < prev.length
          next_left = left.zero? ? 0 : prev[left - 1]
          next_right = right == prev.length - 1 ? 0 : prev[right + 1]

          current.unshift(prev[left] + next_left)
          current.push(prev[right] + next_right)

          left -= 1
          right += 1
        end

        result.push(current)
      end

      result
    end
  end
end
