# frozen_string_literal: true

module LeetCode
  # 55. Jump Game
  module LC55
    # Description:
    # You are given an integer array nums. You are initially positioned at the array's first index,
    # and each element in the array represents your maximum jump length at that position.
    #
    # Return true if you can reach the last index, or false otherwise.
    #
    # Examples:
    # Input: nums = [2, 3, 1, 1, 4]
    # Output: true
    #
    # Input: nums = [3, 2, 1, 0, 4]
    # Output: false
    #
    # @param {Array<Integer>} nums
    # @return {Boolean}
    def can_jump(nums)
      result = private_methods.grep(/^can_jump_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def can_jump_1(nums)
      cache = {}

      rec = ->(i) {
        return true if i >= nums.length - 1
        return false if nums[i] == 0

        cache[i] ||= nums[i].downto(1).any? { |j| rec.call(i + j) }
      }

      rec.call(0)
    end

    def can_jump_2(nums)
      cache = Array.new(nums.length) { |i| i == 0 }

      (0...nums.length).each { |i|
        next if !cache[i]

        (1..nums[i]).each { |j|
          cache[i + j] = true if i + j < cache.length
        }
      }

      cache[-1]
    end

    def can_jump_3(nums)
      closest = nums.length - 1

      (nums.length - 1).downto(0).each { |i|
        closest = i if i + nums[i] >= closest
      }

      closest == 0
    end
  end
end
