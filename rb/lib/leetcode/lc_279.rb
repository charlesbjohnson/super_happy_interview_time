# frozen_string_literal: true

require("set")

module LeetCode
  # 279. Perfect Squares
  module LC279
    def generate_squares(n)
      (1..n).each.with_object([]) { |v, squares|
        square = v * v
        return squares if square > n

        squares.push(square)
      }
    end

    # Desciption:
    # Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.
    #
    # Examples:
    # - 1:
    #   Input: 12
    #   Output: 3
    #   Explanation: 12 = 4 + 4 + 4
    #
    # - 2:
    #   Input: 13
    #   Output: 2
    #   Explanation: 4 + 9
    #
    # @param n {Integer}
    # @return {Integer}
    def num_squares(n)
      squares = generate_squares(n)

      queue = Set.new([n])
      result = 0

      until queue.empty?
        result += 1
        tmp = Set.new

        queue.each { |v|
          squares.each { |square|
            return result if square == v
            break if square > v

            tmp.add(v - square)
          }
        }

        queue = tmp
      end

      result
    end
  end
end
