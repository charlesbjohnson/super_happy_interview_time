# frozen_string_literal: true

module LeetCode
  # 421. Maximum XOR of Two Numbers in an Array
  module LC421
    # Description:
    # Given an integer array nums, return the maximum result of nums[i] XOR nums[j], where 0 <= i <= j < n.
    #
    # Examples:
    # Input: nums = [3, 10, 5, 25, 2, 8]
    # Output: 28
    #
    # Input: nums = [14, 70, 53, 83, 49, 91, 36, 80, 92, 51, 66, 70]
    # Output: 127
    #
    # @param {Array<Integer>} nums
    # @return {Integer}
    def find_maximum_xor(nums)
      result = -Float::INFINITY
      root = TrieNode.new

      nums.each { |num|
        cursor = root

        (0...32).reverse_each { |i|
          cursor = cursor.children[num[i]] ||= TrieNode.new
        }
      }

      nums.each { |num|
        cursor = root
        sum = 0

        (0...32).reverse_each { |i|
          if cursor.children[num[i] ^ 1]
            sum += 1 << i
            cursor = cursor.children[num[i] ^ 1]
          else
            cursor = cursor.children[num[i]]
          end
        }

        result = [result, sum].max
      }

      result
    end

    TrieNode = Struct.new(:children) {
      def initialize(children = Array.new(2))
        super
      end
    }
  end
end
