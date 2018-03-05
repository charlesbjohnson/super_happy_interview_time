# frozen_string_literal: true

module LeetCode
  # 198. House Robber
  module LC198
    # Description:
    # You are a professional robber planning to rob houses along a street.
    #
    # Each house has a certain amount of money stashed, the only constraint stopping
    # you from robbing each of them is that adjacent houses have security system
    # connected and it will automatically contact the police if two adjacent houses
    # were broken into on the same night.
    #
    # Given a list of non-negative integers representing the amount of money of each house,
    # determine the maximum amount of money you can rob tonight without alerting the police.
    #
    # @param list {Array<Integer>}
    # @return {Integer}
    def rob(list)
      return 0 if list.empty?
      return list[0] if list.length == 1
      return [list[0], list[1]].max if list.length == 2

      cache = [list[0], [list[0], list[1]].max]

      (2...list.length).each do |i|
        cache[i] = [list[i] + cache[i - 2], cache[i - 1]].max
      end

      cache[list.length - 1]
    end
  end
end
