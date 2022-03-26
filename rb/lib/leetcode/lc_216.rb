# frozen_string_literal: true

module LeetCode
  # 216. Combination Sum III
  module LC216
    # Description:
    # Find all valid combinations of k numbers that sum up to n such that the following conditions are true:
    # - Only numbers 1 through 9 are used.
    # - Each number is used at most once.
    #
    # Return a list of all possible valid combinations.
    #
    # The list must not contain the same combination twice, and the combinations may be returned in any order.
    #
    # Examples:
    # Input: k = 3, n = 7
    # Output: [[1, 2, 4]]
    #
    # Input: k = 3, n = 9
    # Output: [[1, 2, 6], [1, 3, 5], [2, 3, 4]]
    #
    # Input: k = 4, n = 1
    # Output: []
    #
    # @param {Integer} k
    # @param {Integer} n
    # @return {Array<Array<Integer>>}
    def combination_sum3(k, n)
      result = private_methods.grep(/^combination_sum3_\d+$/).map { |m| send(m, k, n).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def combination_sum3_1(k, n)
      rec = ->(i, combination, sum) {
        return [combination] if sum == n && combination.length == k

        return [] if i > 9
        return [] if n - sum < i
        return [] if n - sum > ((9 - (k - combination.length))..9).sum

        rec.call(i + 1, combination + [i], sum + i) + rec.call(i + 1, combination, sum)
      }

      rec.call(1, [], 0)
    end

    def combination_sum3_2(k, n)
      result = []
      stack = [[1, [], 0]]

      until stack.empty?
        i, combination, sum = stack.pop

        if sum == n && combination.length == k
          result.push(combination)
          next
        end

        next if i > 9
        next if n - sum < i
        next if n - sum > ((9 - (k - combination.length))..9).sum

        stack.push([i + 1, combination, sum])
        stack.push([i + 1, combination + [i], sum + i])
      end

      result
    end

    def combination_sum3_3(k, n)
      result = []

      combination = []
      sum = 0

      rec = ->(i) {
        if sum == n && combination.length == k
          result.push(combination.clone)
          return
        end

        return if i > 9
        return if n - sum < i
        return if n - sum > ((9 - (k - combination.length))..9).sum

        combination.push(i)
        sum += i
        rec.call(i + 1)
        sum -= i
        combination.pop

        rec.call(i + 1)
      }

      rec.call(1)
      result
    end

    def combination_sum3_4(k, n)
      result = []

      combination = []
      sum = 0

      rec = ->(i) {
        if sum == n && combination.length == k
          result.push(combination.clone)
          return
        end

        return if i > 9
        return if n - sum < i
        return if n - sum > ((9 - (k - combination.length))..9).sum

        (i..9).each { |j|
          combination.push(j)
          sum += j
          rec.call(j + 1)
          sum -= j
          combination.pop
        }
      }

      rec.call(1)
      result
    end
  end
end
