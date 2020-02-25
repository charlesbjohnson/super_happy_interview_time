# typed: true
# frozen_string_literal: true

module LeetCode
  # 347. Top K Frequent Elements
  module LC347
    # Description:
    # Given a non-empty array of integers, return the k most frequent elements.
    #
    # Examples:
    # Input: list = [1, 1, 1, 2, 2, 3], k = 2
    # Output: [1, 2]
    #
    # Notes:
    # - You may assume k is always valid, 1 <= k <= number of unique elements.
    # - Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
    #
    # @param list {Array<Integer}
    # @param k {Integer}
    # @return {Array<Integer>}
    def top_k_frequent(list, k)
      list = list.each.with_object(Hash.new { 0 }) { |n, counts| counts[n] += 1 }
      list = list.each.with_object([]) { |(n, count), counts|
        counts[count] = [] unless counts[count]
        counts[count].push(n)
      }

      result = []

      until list.empty?
        groups = list.pop
        next unless groups

        groups.each do |n|
          return result if k.zero?

          result.push(n)
          k -= 1
        end
      end

      result
    end
  end
end
