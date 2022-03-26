# frozen_string_literal: true

module LeetCode
  # 698. Partition to K Equal Sum Subsets
  module LC698
    # Description:
    # Given an integer array nums and an integer k,
    # return true if it is possible to divide this array into k non-empty subsets whose sums are all equal.
    #
    # Examples:
    # Input: nums = [4, 3, 2, 3, 5, 2, 1], k = 4
    # Output: true
    #
    # Input: nums = [1, 2, 3, 4], k = 3
    # Output: false
    #
    # @param {Array<Integer>} nums
    # @param {Integer} k
    # @return {Boolean}
    def can_partition_k_subsets(nums, k)
      result = private_methods.grep(/^can_partition_k_subsets_\d+$/).map { |m| send(m, nums, k) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def can_partition_k_subsets_1(nums, k)
      total = nums.sum
      target = total / k

      return false if total % k != 0

      rec = ->(i, subsets) {
        return true if subsets.all? { |subset| subset.sum == target }
        return false if i == nums.length

        subsets.any? { |subset|
          subset.push(nums[i])
          rec.call(i + 1, subsets)
          subset.pop
        }
      }

      rec.call(0, Array.new(k) { [] })
    end

    def can_partition_k_subsets_2(nums, k)
      total = nums.sum
      target = total / k

      return false if total % k != 0

      nums.sort! { |a, b| b <=> a }

      cache = {}
      used = 0

      rec = ->(i, sum, subset) {
        return true if subset == k - 1
        return cache[used] if cache.key?(used)
        return rec.call(0, 0, subset + 1) if sum == target

        cache[used] ||= (i...nums.length).any? { |j|
          next false if used & (1 << j) != 0
          next false if sum + nums[j] > target

          used |= (1 << j)
          tmp = rec.call(j + 1, sum + nums[j], subset)
          used &= ~(1 << j)

          tmp
        }
      }

      rec.call(0, 0, 0)
    end
  end
end
