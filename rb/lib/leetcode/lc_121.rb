# typed: false
# frozen_string_literal: true

module LeetCode
  # 121. Best Time to Buy and Sell Stock
  module LC121
    # Description:
    # Say you have an array for which the ith element is the price of a given stock on day i.
    #
    # If you were only permitted to complete at most one transaction (ie. buy one and sell one share of the stock),
    # design an algorithm to find the maximum profit.
    #
    # Examples:
    # - 1:
    #   Input: [7, 1, 5, 3, 6, 4]
    #   Output: 5
    #
    #   Max difference = (6 - 1) = 5.
    #   Cannot be (7 - 1) = 6, since selling price needs to be larger than buying price.
    #
    # - 2:
    #   Input: [7, 6, 4, 3, 1]
    #   Output: 0
    #
    #   In this case, no transaction is done, i.e. max profit = 0.
    #
    # @param prices {Array<Integer>}
    # @return {Integer}
    def max_profit(prices)
      cheapest = Float::INFINITY
      profit = 0

      prices.each do |price|
        if price < cheapest
          cheapest = price
        elsif price - cheapest > profit
          profit = price - cheapest
        end
      end

      profit
    end
  end
end
