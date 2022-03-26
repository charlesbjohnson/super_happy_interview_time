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
      result = private_methods.grep(/^max_profit_\d+$/).map { |m| send(m, prices) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def max_profit_1(prices)
      result = 0
      min = prices[0]

      (1...prices.length).each { |i|
        result = [result, prices[i] - min].max
        min = [min, prices[i]].min
      }

      result
    end

    def max_profit_2(prices)
      result = 0
      max = prices[-1]

      (prices.length - 2).downto(0) { |i|
        result = [result, max - prices[i]].max
        max = [max, prices[i]].max
      }

      result
    end

    def max_profit_3(prices)
      result = 0
      current = 0

      (1...prices.length).each { |i|
        current = [prices[i] - prices[i - 1], (prices[i] - prices[i - 1]) + current].max
        result = [result, current].max
      }

      result
    end
  end
end
