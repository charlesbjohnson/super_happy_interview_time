# frozen_string_literal: true

module LeetCode
  # 740. Delete and Earn
  module LC740
    # Description:
    # You are given an integer array nums.
    # You want to maximize the number of points you get by performing the following operation any number of times:
    # - Pick any nums[i] and delete it to earn nums[i] points.
    #   Afterwards, you must delete every element equal to nums[i] - 1 and every element equal to nums[i] + 1.
    #
    # Return the maximum number of points you can earn by applying the above operation some number of times.
    #
    # Examples:
    # Input: nums = [3, 4, 2]
    # Output: 6
    #
    # Input: nums = [2, 2, 3, 3, 3, 4]
    # Output: 9
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def delete_and_earn(nums)
      result = private_methods.grep(/^delete_and_earn_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def delete_and_earn_1(nums)
      cache = {}

      nums.sort!
      counts = nums.tally

      rec = ->(i) {
        return 0 if i == nums[-1] + 1

        cache[i] ||= [
          (i * counts.fetch(i, 0)) + (i + 2 <= nums[-1] ? rec.call(i + 2) : 0),
          rec.call(i + 1)
        ].max
      }

      rec.call(nums[0])
    end

    def delete_and_earn_2(nums)
      nums.sort!
      counts = nums.tally

      cache = Array.new(nums[-1] + 2, 0)

      nums[-1].downto(nums[0]) { |i|
        cache[i] = [
          (i * counts.fetch(i, 0)) + (i + 2 <= nums[-1] ? cache[i + 2] : 0),
          cache[i + 1]
        ].max
      }

      cache[nums[0]]
    end
  end
end
