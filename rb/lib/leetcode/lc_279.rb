# frozen_string_literal: true

require("set")

module LeetCode
  # 279. Perfect Squares
  module LC279
    # Desciption:
    # Given an integer n, return the least number of perfect square numbers that sum to n.
    #
    # A perfect square is an integer that is the square of an integer;
    # in other words, it is the product of some integer with itself.
    # For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.
    #
    # Examples:
    # Input: n = 12
    # Output: 3
    #
    # Input: n = 13
    # Output: 2
    #
    # @param {Integer} n
    # @return {Integer}
    def num_squares(n)
      perfect_squares = (1..n).each_with_object([]) { |v, ps|
        ps.push(v**2) if v**2 <= n
      }

      queue = [[n, 0]]

      until queue.empty?
        remaining, count = queue.shift

        perfect_squares.reverse_each { |perfect_square|
          return count + 1 if perfect_square == remaining

          if perfect_square < remaining
            queue.push([remaining - perfect_square, count + 1])
          end
        }
      end

      n
    end
  end
end
