# frozen_string_literal: true

module LeetCode
  # 15. 3Sum
  module LC15
    # Description:
    # Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k,
    # and nums[i] + nums[j] + nums[k] == 0.
    #
    # Notice that the solution set must not contain duplicate triplets.
    #
    # Examples:
    # Input: nums = [-1, 0, 1, 2, -1, -4]
    # Output: [[-1, -1, 2], [-1, 0, 1]]
    #
    # Input: nums = []
    # Output: []
    #
    # Input: nums = [0]
    # Output: []
    #
    # @param {Array<Integer>} nums
    # @return {Array<Array<(Integer, Integer, Integer)>}
    def three_sum(nums)
      result = private_methods.grep(/^three_sum_\d+$/).map { |m| send(m, nums.clone) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def three_sum_1(nums)
      nums.sort!

      result = []

      (0...nums.length).each { |i|
        next if i - 1 >= 0 && nums[i - 1] == nums[i]

        ((i + 1)...nums.length).each { |j|
          next if j - 1 > i && nums[j - 1] == nums[j]

          ((j + 1)...nums.length).each { |k|
            next if k - 1 > j && nums[k - 1] == nums[k]

            result.push([nums[i], nums[j], nums[k]]) if nums[i] + nums[j] + nums[k] == 0
          }
        }
      }

      result
    end

    def three_sum_2(nums)
      nums.sort!

      result = []

      (0...nums.length).each { |i|
        next if i - 1 >= 0 && nums[i - 1] == nums[i]

        l = i + 1
        r = nums.length - 1

        while l < r
          case nums[l] + nums[r] <=> -nums[i]
          when 0
            result.push([nums[i], nums[l], nums[r]])
            l += 1
            l += 1 while l < r && nums[l - 1] == nums[l]
          when -1
            l += 1
          when 1
            r -= 1
          end
        end
      }

      result
    end
  end
end
