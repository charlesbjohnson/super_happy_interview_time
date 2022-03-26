# frozen_string_literal: true

module LeetCode
  # 78. Subsets
  module LC78
    # Description:
    # Given an integer array nums of unique elements, return all possible subsets (the power set).
    #
    # The solution set must not contain duplicate subsets. Return the solution in any order.
    #
    # Input: nums = [1, 2, 3]
    # Output: [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
    #
    # Input: nums = [0]
    # Output: [[], [0]]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Array<Integer>>}
    def subsets(nums)
      result = private_methods.grep(/^subsets_\d+$/).map { |m| send(m, nums).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def subsets_1(nums)
      rec = ->(i, subset) {
        return [subset] if i == nums.length

        rec.call(i + 1, subset) + rec.call(i + 1, subset + [nums[i]])
      }

      rec.call(0, [])
    end

    def subsets_2(nums)
      result = []
      stack = [[0, []]]

      until stack.empty?
        i, subset = stack.pop

        if i == nums.length
          result.push(subset)
          next
        end

        stack.push([i + 1, subset + [nums[i]]])
        stack.push([i + 1, subset])
      end

      result
    end

    def subsets_3(nums)
      result = []
      subset = []

      rec = ->(i) {
        if i == nums.length
          result.push(subset.clone)
          return
        end

        rec.call(i + 1)

        subset.push(nums[i])
        rec.call(i + 1)
        subset.pop
      }

      rec.call(0)
      result
    end

    def subsets_4(nums)
      result = []
      subset = []

      rec = ->(i, k) {
        if subset.length == k
          result.push(subset.clone)
          return
        end

        (i...nums.length).each { |j|
          subset.push(nums[j])
          rec.call(j + 1, k)
          subset.pop
        }
      }

      (0..nums.length).each { |k|
        rec.call(0, k)
      }

      result
    end
  end
end
