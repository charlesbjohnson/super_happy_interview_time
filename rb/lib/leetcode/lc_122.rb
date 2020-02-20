# typed: true
# frozen_string_literal: true

module LeetCode
  # 122. Best Time to Buy and Sell Stock II
  module LC122
    # Description:
    # Say you have an array for which the ith element is the price of a given stock on day i.
    #
    # Design an algorithm to find the maximum profit.
    #
    # You may complete as many transactions as you like (ie. buy one and sell one share of the stock multiple times).
    # However, you may not engage in multiple transactions at the same time (ie. you must sell the stock before you buy again).
    #
    # @param prices {Array<Integer>}
    # @return {Integer}
    def max_profit(prices)
      return 0 if prices.length < 2

      profits = 0

      low = 0
      high = 1

      while low < prices.length - 1 && high < prices.length
        profit = prices[high] - prices[low]

        profits += profit if profit.positive?

        low += 1
        high += 1
      end

      profits
    end
  end
end
