# frozen_string_literal: true

module LeetCode
  # 739. Daily Temperatures
  module LC739
    # Description:
    # Given an array of integers temperatures represents the daily temperatures,
    # return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature.
    # If there is no future day for which this is possible, keep answer[i] == 0 instead.
    #
    # Examples:
    # Input: temperatures = [73, 74, 75, 71, 69, 72, 76, 73]
    # Output: [1, 1, 4, 2, 1, 1, 0, 0]
    #
    # Input: temperatures = [30, 40, 50, 60]
    # Output: [1, 1, 1, 0]
    #
    # Input: temperatures = [30, 60, 90]
    # Output: [1, 1, 0]
    #
    # @param {Array<Integer>} temperatures
    # @return {Array<Integer>}
    def daily_temperatures(temperatures)
      result = Array.new(temperatures.length, 0)
      max = 0

      (0...temperatures.length).reverse_each { |i|
        if temperatures[i] >= max
          max = temperatures[i]
          next
        end

        days = 1
        days += result[i + days] while temperatures[i] >= temperatures[i + days]
        result[i] = days
      }

      result
    end
  end
end
