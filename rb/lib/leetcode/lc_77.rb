# frozen_string_literal: true

module LeetCode
  # 77. Combinations
  module LC77
    # Description:
    # Given two integers n and k, return all possible combinations of k numbers out of the range [1, n].
    # You may return the answer in any order.
    #
    # Examples:
    # Input: n = 4, k = 2
    # Output:
    # [
    #   [2, 4],
    #   [3, 4],
    #   [2, 3],
    #   [1, 2],
    #   [1, 3],
    #   [1, 4],
    # ]
    #
    # Input: n = 1, k = 1
    # Output: [
    #   [1]
    # ]
    #
    # @param {Integer} n
    # @param {Integer} k
    # @return {Array<Array<Integer>>}
    def combine(n, k)
      result = private_methods.grep(/^combine_\d+$/).map { |m| send(m, n, k).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def combine_1(n, k)
      rec = ->(i, combination) {
        return [combination] if combination.length == k
        return [] if k - combination.length > (n - i) + 1

        rec.call(i + 1, combination) + rec.call(i + 1, combination + [i])
      }

      rec.call(1, [])
    end

    def combine_2(n, k)
      result = []
      stack = [[1, []]]

      until stack.empty?
        i, combination = stack.pop

        if combination.length == k
          result.push(combination)
          next
        end

        next if k - combination.length > (n - i) + 1

        stack.push([i + 1, combination + [i]])
        stack.push([i + 1, combination])
      end

      result
    end

    def combine_3(n, k)
      result = []
      combination = []

      rec = ->(i) {
        if combination.length == k
          result.push(combination.clone)
          return
        end

        return if k - combination.length > (n - i) + 1

        rec.call(i + 1)

        combination.push(i)
        rec.call(i + 1)
        combination.pop
      }

      rec.call(1)
      result
    end

    def combine_4(n, k)
      result = []
      combination = []

      rec = ->(i) {
        if combination.length == k
          result.push(combination.clone)
          return
        end

        (i..n).each { |j|
          combination.push(j)
          rec.call(j + 1)
          combination.pop
        }
      }

      rec.call(1)
      result
    end
  end
end
