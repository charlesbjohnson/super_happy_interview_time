# frozen_string_literal: true

module LeetCode
  # 309. Best Time to Buy and Sell Stock with Cooldown
  module LC309
    def max_profit_recurse(prices, i, bought_at, cache)
      return 0 if i >= prices.length

      unless bought_at
        return cache[:buy][i] if cache[:buy][i]

        no_buy = max_profit_recurse(prices, i + 1, nil, cache)
        buy = max_profit_recurse(prices, i + 1, prices[i], cache)

        cache[:buy][i] = [no_buy, buy].max
        return cache[:buy][i]
      end

      return cache.dig(:sell, i, bought_at) if cache.dig(:sell, i, bought_at)

      no_sell = max_profit_recurse(prices, i + 1, bought_at, cache)
      sell = (prices[i] - bought_at) + max_profit_recurse(prices, i + 2, nil, cache)

      cache[:sell][i] = {} unless cache[:sell][i]
      cache[:sell][i][bought_at] = [no_sell, sell].max
      cache[:sell][i][bought_at]
    end

    # Description:
    # Say you have an array for which the ith element is the price of a given stock on day i.
    # Design an algorithm to find the maximum profit.
    #
    # You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:
    # - You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
    # - After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)
    #
    # Examples:
    # Input: [1, 2, 3, 0, 2]
    # Output: 3
    # Explanation: [buy, sell, cooldown, buy, sell]
    #
    # @param prices {Array<Integer>}
    # @return {Integer}
    def max_profit(prices)
      return 0 if prices.empty?

      max_profit_recurse(prices, 0, nil, buy: {}, sell: {})
    end
  end
end
