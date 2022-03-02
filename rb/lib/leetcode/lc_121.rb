# frozen_string_literal: true

module LeetCode
  # 121. Best Time to Buy and Sell Stock
  module LC121
    # Description:
    # You are given an array prices where prices[i] is the price of a given stock on the ith day.
    # You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
    #
    # Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
    #
    # Input: prices = [7, 1, 5, 3, 6, 4]
    # Output: 5
    #
    # Input: prices = [7, 6, 4, 3, 1]
    # Output: 0
    #
    # @param {Array<Integer>} prices
    # @return {Integer}
    def max_profit(prices)
      result = 0
      max = prices[-1]

      (prices.length - 2).downto(0) { |i|
        result = [result, max - prices[i]].max
        max = [max, prices[i]].max
      }

      result
    end
  end
end
