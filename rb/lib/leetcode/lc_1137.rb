# frozen_string_literal: true

module LeetCode
  # 1137. N-th Tribonacci Number
  module LC1137
    # Description:
    # The Tribonacci sequence Tn is defined as follows:
    # T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.
    #
    # Given n, return the value of Tn.
    #
    # Examples:
    # Input: n = 4
    # Output: 4
    #
    # Input: n = 25
    # Output: 1389537
    #
    # @param {Integer} n
    # @return {Integer}
    def tribonacci(n)
      result = private_methods.grep(/^tribonacci_\d+$/).map { |m| send(m, n) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def tribonacci_1(n)
      cache = {}

      rec = ->(n) {
        return 0 if n == 0
        return 1 if n < 3

        cache[n] ||= rec.call(n - 3) + rec.call(n - 2) + rec.call(n - 1)
      }

      rec.call(n)
    end

    def tribonacci_2(n)
      result = Array.new(n + 1, 0)

      (1..n).each { |i|
        result[i] = i < 3 ? 1 : result[i - 3] + result[i - 2] + result[i - 1]
      }

      result[n]
    end
  end
end
