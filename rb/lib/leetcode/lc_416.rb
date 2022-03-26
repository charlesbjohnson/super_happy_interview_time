# frozen_string_literal: true

require("set")

module LeetCode
  # 416. Partition Equal Subset Sum
  module LC416
    # Description:
    # Given a non-empty array nums containing only positive integers,
    # find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.
    #
    # Examples:
    # Input: nums = [1, 5, 11, 5]
    # Output: true
    #
    # Input: nums = [1, 2, 3, 5]
    # Output: false
    #
    # @param {Array<Integer>} nums
    # @return {Boolean}
    def can_partition(nums)
      result = private_methods.grep(/^can_partition_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def can_partition_1(nums)
      total = nums.sum
      target = total / 2

      return false if total.odd?

      cache = {}

      rec = ->(i, sum) {
        return true if sum == target
        return false if i == nums.length

        cache[[i, sum]] ||= (sum + nums[i] <= target && rec.call(i + 1, sum + nums[i])) || rec.call(i + 1, sum)
      }

      rec.call(0, 0)
    end

    def can_partition_2(nums)
      total = nums.sum
      target = total / 2

      return false if total.odd?

      cache = Array.new(nums.length + 1) { Array.new(target + 1) { |sum| sum == target } }

      (nums.length - 1).downto(0) { |i|
        (target - 1).downto(0) { |sum|
          cache[i][sum] = (sum + nums[i] <= target && cache[i + 1][sum + nums[i]]) || cache[i + 1][sum]
        }
      }

      cache[0][0]
    end

    def can_partition_3(nums)
      total = nums.sum
      target = total / 2

      return false if total.odd?

      set = Set.new([0])

      (0...nums.length).each { |i|
        n_set = Set.new(set)

        set.each { |sum|
          return true if sum + nums[i] == target
          n_set.add(sum + nums[i])
        }

        set = n_set
      }

      false
    end
  end
end
