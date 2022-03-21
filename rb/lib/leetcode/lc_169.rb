# frozen_string_literal: true

module LeetCode
  # 169. Majority Element
  module LC169
    # Description:
    # Given an array nums of size n, return the majority element.
    #
    # The majority element is the element that appears more than n / 2 times.
    # You may assume that the majority element always exists in the array.
    #
    # Follow-up: Could you solve the problem in linear time and in O(1) space?
    #
    # Examples:
    # Input: nums = [3, 2, 3]
    # Output: 3
    #
    # Input: nums = [2, 2, 1, 1, 1, 2, 2]
    # Output: 2
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def majority_element(nums)
      result = private_methods.grep(/^majority_element_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def majority_element_1(nums)
      hash = Hash.new(0)
      result = [nil, 0]

      nums.each { |num|
        hash[num] += 1

        if hash[num] > result[1]
          result[0], result[1] = num, hash[num]
        end
      }

      result[0]
    end

    def majority_element_2(nums)
      result = [nums[0], 1]

      (1...nums.length).each { |i|
        if result[0] == nums[i]
          result[1] += 1
        elsif result[1] == 0
          result[0] = nums[i]
          result[1] = 1
        else
          result[1] -= 1
        end
      }

      result[0]
    end
  end
end
