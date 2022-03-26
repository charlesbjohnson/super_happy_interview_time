# frozen_string_literal: true

module LeetCode
  # 1155. Number of Dice Rolls With Target Sum
  module LC1155
    # Description:
    # You have n dice and each die has k faces numbered from 1 to k.
    # Given three integers n, k, and target, return the number of possible ways (out of the kn total ways) to roll the dice so the sum of the face-up numbers equals target.
    #
    # Since the answer may be too large, return it modulo 109 + 7.
    #
    # Examples:
    # Input: n = 1, k = 6, target = 3
    # Output: 1
    #
    # Input: n = 2, k = 6, target = 7
    # Output: 6
    #
    # Input: n = 30, k = 30, target = 500
    # Output: 222616187
    #
    # @param {Integer} n
    # @param {Integer} k
    # @param {Integer} target
    # @return {Integer}
    def num_rolls_to_target(n, k, target)
      result = private_methods.grep(/^num_rolls_to_target_\d+$/).map { |m| send(m, n, k, target) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def num_rolls_to_target_1(n, k, target)
      cache = {}

      rec = ->(i, t) {
        return t == target ? 1 : 0 if i == n

        cache[[i, t]] ||= (1..k).map { |v|
          rec.call(i + 1, t + v)
        }.sum
      }

      rec.call(0, 0) % (10**9 + 7)
    end

    def num_rolls_to_target_2(n, k, target)
      cache = Array.new(n + 1) { |i| Array.new(target + 1) { |t| i == n && t == target ? 1 : 0 } }

      (n - 1).downto(0) { |i|
        (i * k).downto(i) { |t|
          cache[i][t] = (1..[target - t, k].min).map { |v|
            cache[i + 1][t + v]
          }.sum
        }
      }

      cache[0][0] % (10**9 + 7)
    end
  end
end
