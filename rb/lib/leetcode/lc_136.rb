# frozen_string_literal: true

module LeetCode
  # 136. Single Number
  module LC136
    # Description:
    # Given an array of integers, every element appears twice except for one.
    # Find the single one.
    #
    # Notes:
    # - Your algorithm should have a linear runtime complexity.
    # - Could you implement it without using extra memory?
    #
    # @param list {Array<Integer>}
    # @return {Integer}
    def single_number(list)
      list.reduce(0) { |a, v| a ^ v }
    end
  end
end
