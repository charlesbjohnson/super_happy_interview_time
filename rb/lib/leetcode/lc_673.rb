# frozen_string_literal: true

module LeetCode
  # 673. Number of Longest Increasing Subsequence
  module LC673
    # Description:
    # Given an integer array nums, return the number of longest increasing subsequences.
    # Notice that the sequence has to be strictly increasing.
    #
    # Examples:
    # Input: nums = [1, 3, 5, 4, 7]
    # Output: 2
    #
    # Input: nums = [2, 2, 2, 2, 2]
    # Output: 5
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def find_number_of_lis(nums)
      result = private_methods.grep(/^find_number_of_lis_\d+$/).map { |m| send(m, nums) }.uniq
      result.length == 1 ? result[0] : raise
    end

    private

    def find_number_of_lis_1(nums)
      result = 0
      max_max = 0

      cache = {}

      rec = ->(i) {
        return [1, 1] if i == nums.length - 1
        return cache[i] if cache.key?(i)

        max = 1
        count = 1

        ((i + 1)...nums.length).each { |j|
          if nums[i] < nums[j]
            n_max, n_count = rec.call(j)

            case max <=> n_max + 1
            when -1
              max = n_max + 1
              count = n_count
            when 0
              count += n_count
            end
          end
        }

        cache[i] = [max, count]
      }

      (0...nums.length).each { |i|
        max, count = rec.call(i)

        case max_max <=> max
        when -1
          max_max = max
          result = count
        when 0
          result += count
        end
      }

      result
    end

    def find_number_of_lis_2(nums)
      result = 0
      max_max = 0

      cache = Array.new(nums.length)

      (nums.length - 1).downto(0) { |i|
        max = 1
        count = 1

        (i...nums.length).each { |j|
          if nums[i] < nums[j]
            n_max, n_count = cache[j]

            case max <=> n_max + 1
            when -1
              max = n_max + 1
              count = n_count
            when 0
              count += n_count
            end
          end
        }

        cache[i] = [max, count]
      }

      (0...nums.length).each { |i|
        max, count = cache[i]

        case max_max <=> max
        when -1
          max_max = max
          result = count
        when 0
          result += count
        end
      }

      result
    end
  end
end
