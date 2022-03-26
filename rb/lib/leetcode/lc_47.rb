# frozen_string_literal: true

module LeetCode
  # 47. Permutations II
  module LC47
    # Description:
    # Given a collection of numbers, nums, that might contain duplicates,
    # return all possible unique permutations in any order.
    #
    # Examples:
    # Input: nums = [1, 1, 2]
    # Output: [[1, 1, 2], [1, 2, 1], [2, 1, 1]]
    #
    # Input: nums = [1, 2, 3]
    # Output: [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
    #
    # @param {Array<Integer>} nums
    # @return {Array<Array<Integer>>}
    def permute_unique(nums)
      result = private_methods.grep(/^permute_unique_\d+$/).map { |m| send(m, nums.clone).sort }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def permute_unique_1(nums)
      nums.sort!

      rec = ->(remaining, permutation) {
        return [permutation] if remaining.empty?

        remaining.each_index.flat_map { |i|
          if i == 0 || remaining[i] != remaining[i - 1]
            rec.call(remaining[...i] + remaining[i + 1...], permutation + [remaining[i]])
          else
            []
          end
        }
      }

      rec.call(nums, [])
    end

    def permute_unique_2(nums)
      nums.sort!

      result = []
      stack = [[nums, []]]

      until stack.empty?
        remaining, permutation = stack.pop

        if remaining.empty?
          result.push(permutation)
          next
        end

        remaining.each_index { |i|
          if i == 0 || remaining[i] != remaining[i - 1]
            stack.push([remaining[...i] + remaining[i + 1...], permutation + [remaining[i]]])
          end
        }
      end

      result
    end

    def permute_unique_3(nums)
      nums.sort!

      result = []

      rec = ->(i) {
        if i == nums.length
          result.push(nums.clone)
          return
        end

        (i...nums.length).each { |j|
          if i == j || nums[j] != nums[j - 1]
            nums[i], nums[j] = nums[j], nums[i]
            rec.call(i + 1)
            nums[i], nums[j] = nums[j], nums[i]
          end
        }
      }

      rec.call(0)
      result
    end
  end
end
