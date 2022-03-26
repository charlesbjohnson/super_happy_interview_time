# frozen_string_literal: true

module LeetCode
  # 90. Subsets II
  module LC90
    # Description:
    # Given an integer array nums that may contain duplicates, return all possible subsets (the power set).
    #
    # The solution set must not contain duplicate subsets. Return the solution in any order.
    #
    # Examples:
    # Input: nums = [1, 2, 2]
    # Output: [[], [1], [1, 2], [1, 2, 2], [2], [2, 2]]
    #
    # Input: nums = [0]
    # Output: [[], [0]]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Array<Integer>>}
    def subsets_with_dup(nums)
      result = private_methods.grep(/^subsets_with_dup_\d+$/).map { |m| send(m, nums.clone).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def subsets_with_dup_1(nums)
      nums.sort!

      rec = ->(i, subset) {
        return [subset] if i == nums.length

        j = i + 1
        j += 1 while j < nums.length && nums[j] == nums[j - 1]

        rec.call(i + 1, subset + [nums[i]]) + rec.call(j, subset)
      }

      rec.call(0, [])
    end

    def subsets_with_dup_2(nums)
      nums.sort!

      result = []
      stack = [[0, []]]

      until stack.empty?
        i, subset = stack.pop

        if i == nums.length
          result.push(subset)
          next
        end

        j = i + 1
        j += 1 while j < nums.length && nums[j] == nums[j - 1]

        stack.push([j, subset])
        stack.push([i + 1, subset + [nums[i]]])
      end

      result
    end

    def subsets_with_dup_3(nums)
      nums.sort!

      result = []
      subset = []

      rec = ->(i, k) {
        if subset.length == k
          result.push(subset.clone)
          return
        end

        (i...nums.length).each { |j|
          if i == j || nums[j] != nums[j - 1]
            subset.push(nums[j])
            rec.call(j + 1, k)
            subset.pop
          end
        }
      }

      (0..nums.length).each { |k|
        rec.call(0, k)
      }

      result
    end
  end
end
