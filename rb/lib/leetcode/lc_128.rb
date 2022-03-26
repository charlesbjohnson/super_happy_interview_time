# frozen_string_literal: true

module LeetCode
  # 128. Longest Consecutive Sequence
  module LC128
    # Description:
    # Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
    #
    # You must write an algorithm that runs in O(n) time.
    #
    # Examples:
    # Input: nums = [100, 4, 200, 1, 3, 2]
    # Output: 4
    #
    # Input: nums = [0, 3, 7, 2, 5, 8, 4, 6, 0, 1]
    # Output: 9
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def longest_consecutive(nums)
      result = private_methods.grep(/^longest_consecutive_\d+$/).map { |m| send(m, nums.clone) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def longest_consecutive_1(nums)
      return 0 if nums.empty?

      result = 1

      set = Set.new(nums)
      set.each { |num|
        next if set.include?(num - 1)

        count = 1

        while set.include?(num + 1)
          num += 1
          count += 1
        end

        result = [result, count].max
      }

      result
    end

    def longest_consecutive_2(nums)
      return 0 if nums.empty?

      nums.sort!

      result = 1
      count = 1

      (1...nums.length).each { |i|
        if nums[i] - nums[i - 1] <= 1
          count += nums[i] - nums[i - 1]
        else
          count = 1
        end

        result = [result, count].max
      }

      result
    end
  end
end
