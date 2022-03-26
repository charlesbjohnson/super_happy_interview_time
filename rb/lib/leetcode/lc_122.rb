# frozen_string_literal: true

module LeetCode
  # 122. Best Time to Buy and Sell Stock II
  module LC122
    # Description:
    # You are given an integer array prices where prices[i] is the price of a given stock on the ith day.
    #
    # On each day, you may decide to buy and/or sell the stock.
    # You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.
    #
    # Find and return the maximum profit you can achieve.
    #
    # Examples:
    # Input: prices = [7, 1, 5, 3, 6, 4]
    # Output: 7
    #
    # Input: prices = [1, 2, 3, 4, 5]
    # Output: 4
    #
    # Input: prices = [7, 6, 4, 3, 1]
    # Output: 0
    #
    # @param {Array<Integer>} prices
    # @return {Integer}
    def max_profit(prices)
      result = private_methods.grep(/^max_profit_\d+$/).map { |m| send(m, prices) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def max_profit_1(prices)
      cache = {}

      rec = ->(i, h) {
        return 0 if i == prices.length

        cache[[i, h]] ||= if h
          [
            prices[i] + rec.call(i + 1, false),
            rec.call(i + 1, true)
          ].max
        else
          [
            -prices[i] + rec.call(i + 1, true),
            rec.call(i + 1, false)
          ].max
        end
      }

      rec.call(0, false)
    end

    def max_profit_2(prices)
      cache = Array.new(prices.length + 1) { Array.new(2, 0) }

      (prices.length - 1).downto(0) { |i|
        (0..1).each { |h|
          cache[i][h] = if h == 1
            [
              prices[i] + cache[i + 1][0],
              cache[i + 1][1]
            ].max
          else
            [
              -prices[i] + cache[i + 1][1],
              cache[i + 1][0]
            ].max
          end
        }
      }

      cache[0][0]
    end
  end
end
