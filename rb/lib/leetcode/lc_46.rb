# frozen_string_literal: true

module LeetCode
  # 46. Permutations
  module LC46
    # Description:
    # Given an array nums of distinct integers, return all the possible permutations.
    # You can return the answer in any order.
    #
    # Examples:
    # Input: nums = [1, 2, 3]
    # Output: [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
    #
    # Input: nums = [0, 1]
    # Output: [[0, 1], [1, 0]]
    #
    # Input: nums = [1]
    # Output: [[1]]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Array<Integer>>}
    def permute(nums)
      result = private_methods.grep(/^permute_\d+$/).map { |m| send(m, nums).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def permute_1(nums)
      rec = ->(remaining, permutation) {
        return [permutation] if remaining.empty?

        remaining.each_index.flat_map { |i|
          rec.call(remaining[...i] + remaining[i + 1...], permutation + [remaining[i]])
        }
      }

      rec.call(nums, [])
    end

    def permute_2(nums)
      result = []
      stack = [[nums, []]]

      until stack.empty?
        remaining, permutation = stack.pop

        if remaining.empty?
          result.push(permutation)
          next
        end

        remaining.each_index { |i|
          stack.push([remaining[...i] + remaining[i + 1...], permutation + [remaining[i]]])
        }
      end

      result
    end

    def permute_3(nums)
      result = []

      rec = ->(i) {
        if i == nums.length
          result.push(nums.clone)
          return
        end

        (i...nums.length).each { |j|
          nums[i], nums[j] = nums[j], nums[i]
          rec.call(i + 1)
          nums[i], nums[j] = nums[j], nums[i]
        }
      }

      rec.call(0)
      result
    end
  end
end
