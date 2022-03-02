# frozen_string_literal: true

module LeetCode
  # 188. Best Time to Buy and Sell Stock IV
  module LC188
    # Description:
    # You are given an integer array prices where prices[i] is the price of a given stock on the ith day, and an integer k.
    # Find the maximum profit you can achieve. You may complete at most k transactions.
    #
    # Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).
    #
    # Examples:
    # Input: k = 2, prices = [2, 4, 1]
    # Output: 2
    #
    # Input: k = 2, prices = [3, 2, 6, 5, 0, 3]
    # Output: 7
    #
    # @param {Integer} k
    # @param {Array<Integer>} prices
    # @return {Integer}
    def max_profit(k, prices)
      result = private_methods.grep(/^max_profit_\d+$/).map { |m| send(m, k, prices) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def max_profit_1(k, prices)
      cache = {}

      rec = ->(i, t, h) {
        return 0 if i == prices.length || t == k

        cache[[i, t, h]] ||= if h
          [
            prices[i] + rec.call(i + 1, t + 1, false),
            rec.call(i + 1, t, true)
          ].max
        else
          [
            -prices[i] + rec.call(i + 1, t, true),
            rec.call(i + 1, t, false)
          ].max
        end
      }

      rec.call(0, 0, false)
    end

    def max_profit_2(k, prices)
      result = Array.new(prices.length + 1) { Array.new(k + 1) { Array.new(2, 0) } }

      (prices.length - 1).downto(0) { |i|
        (k - 1).downto(0) { |t|
          (0..1).each { |h|
            result[i][t][h] = if h == 1
              [
                prices[i] + result[i + 1][t + 1][0],
                result[i + 1][t][1]
              ].max
            else
              [
                -prices[i] + result[i + 1][t][1],
                result[i + 1][t][0]
              ].max
            end
          }
        }
      }

      result[0][0][0]
    end
  end
end
