# frozen_string_literal: true

module LeetCode
  # 983. Minimum Cost For Tickets
  module LC983
    # Description:
    # You have planned some train traveling one year in advance.
    # The days of the year in which you will travel are given as an integer array days.
    # Each day is an integer from 1 to 365.
    #
    # Train tickets are sold in three different ways:
    # - a 1-day pass is sold for costs[0] dollars,
    # - a 7-day pass is sold for costs[1] dollars, and
    # - a 30-day pass is sold for costs[2] dollars.
    #
    # The passes allow that many days of consecutive travel.
    # - For example, if we get a 7-day pass on day 2, then we can travel for 7 days: 2, 3, 4, 5, 6, 7, and 8.
    #
    # Return the minimum number of dollars you need to travel every day in the given list of days.
    #
    # Examples:
    # Input: days = [1, 4, 6, 7, 8, 20], costs = [2, 7, 15]
    # Output: 11
    #
    # Input: days = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 30, 31], costs = [2, 7, 15]
    # Output: 17
    #
    # @param {Array<Integer>} days
    # @param {Array<Integer>} costs
    # @return {Integer}
    def mincost_tickets(days, costs)
      result = private_methods.grep(/^mincost_tickets_\d+$/).map { |m| send(m, days, costs) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def mincost_tickets_1(days, costs)
      cache = {}

      rec = ->(i) {
        return 0 if i == days.length

        i_01 = i + 1
        i_07 = i + 1
        i_30 = i + 1

        ((i + 1)...days.length).each { |j|
          i_07 = j + 1 if days[j] - days[i] < 7
          i_30 = j + 1 if days[j] - days[i] < 30
          break if days[j] - days[i] >= 30
        }

        cache[i] ||= [
          costs[0] + rec.call(i_01),
          costs[1] + rec.call(i_07),
          costs[2] + rec.call(i_30)
        ].min
      }

      rec.call(0)
    end

    def mincost_tickets_2(days, costs)
      cache = Array.new(days.length + 1, 0)

      (days.length - 1).downto(0) { |i|
        i_01 = i + 1
        i_07 = i + 1
        i_30 = i + 1

        ((i + 1)...days.length).each { |j|
          i_07 = j + 1 if days[j] - days[i] < 7
          i_30 = j + 1 if days[j] - days[i] < 30
          break if days[j] - days[i] >= 30
        }

        cache[i] = [
          costs[0] + cache[i_01],
          costs[1] + cache[i_07],
          costs[2] + cache[i_30]
        ].min
      }

      cache[0]
    end
  end
end
